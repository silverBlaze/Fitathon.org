using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Fitathon.org.Data;
using System.Net;
using System.Web.Script.Serialization;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;

namespace Fitathon.org {
    public class Common {

        const string FITBIT_AUTH_URI = "https://www.fitbit.com/oauth2/authorize";
        const string FITBIT_TOKEN_URI = "https://api.fitbit.com/oauth2/token";
        const string FITBIT_CALLBACK_URI = "http://fitathon.org/Fitbit/Callback.aspx";
        
        const string FITBIT_LTD_SCOPE = "activity";

        static internal Data.user GetUserFromEmail(string email) {
            Data.user u = null;
            using(var ctx = new Data.FitathonDataEntities()) {

                try {
                    u = (from users in ctx.users
                         where users.email == email
                         select users).SingleOrDefault();

                } catch { }
            }
            return u;

        }

        internal static string GetFitbitClientId() {
            string id = null;
            using(var ctx = new Data.FitathonDataEntities()) {

                try {
                    id = (from ap in ctx.appsettings
                          where ap.key == "fitbitClientId"
                          select ap.value).SingleOrDefault();

                } catch { }
            }
            return id;
        }

        internal static string GetFitbitClientSecret() {
            string secret = null;
            using(var ctx = new Data.FitathonDataEntities()) {

                try {
                    secret = (from ap in ctx.appsettings
                              where ap.key == "fitbitClientSecret"
                              select ap.value).SingleOrDefault();
                } catch { }
            }
            return secret;
        }

        public static void RedirectToFitbitAuthFlow(string userToken) {
            string clientId = GetFitbitClientId();
            string url = string.Format("{0}?response_type=code&client_id={1}&redirect_uri={2}&scope={3}&state={4}", FITBIT_AUTH_URI, clientId, HttpUtility.UrlEncode(FITBIT_CALLBACK_URI), HttpUtility.UrlEncode(FITBIT_LTD_SCOPE), userToken);
            HttpContext.Current.Response.Redirect(url);
        }

        public static bool LoadTokensForParticipant(int participantId, bool refresh) {
            try {
                using(var ctx = new Data.FitathonDataEntities()) {
                    var part = (from parts in ctx.participants
                                where parts.id == participantId
                                select parts).SingleOrDefault();

                    if(part == null || string.IsNullOrEmpty(part.fitbitAuthCode)) {
                        HttpContext.Current.Response.Redirect("~", false);
                        return false;
                    }

                    string clientId = GetFitbitClientId();
                    string clientSecret = GetFitbitClientSecret();

                    var authHeaderVal = GetBase64(string.Format("{0}:{1}", clientId, clientSecret));
                    string url;
                    if(!refresh)
                        url = string.Format("{0}?client_id={1}&grant_type=authorization_code&redirect_uri={2}&code={3}", FITBIT_TOKEN_URI, clientId, HttpUtility.UrlEncode(FITBIT_CALLBACK_URI), part.fitbitAuthCode);
                    else
                        url = string.Format("{0}?grant_type=refresh_token&refresh_token={1}", FITBIT_TOKEN_URI, part.fitbitRefreshToken);
                    var cli = new WebClient();
                    var req = WebRequest.Create(url);
                    req.Method = "POST";
                    req.Headers.Add("Authorization", string.Format("Basic {0}", authHeaderVal));
                    req.ContentType = "application/x-www-form-urlencoded";

                    var resp = req.GetResponse();
                    string responseText;
                    using(var s = resp.GetResponseStream()) {
                        using(var sr = new StreamReader(s)) {
                            responseText = sr.ReadToEnd();
                        }
                    }

                    var ser = new JavaScriptSerializer();
                    var tokenResponse = ser.Deserialize<FitbitTokenResponse>(responseText);

                    part.fitbitAccessToken = tokenResponse.access_token;
                    part.fitbitRefreshToken = tokenResponse.refresh_token;
                    //part.fitbitTokenExpires = DateTime.Now.AddSeconds(tokenResponse.expires_in);
                    //part.fitbitUserId = tokenResponse.user_id;

                    ctx.SaveChanges();
                }
            } catch {
                return false;
            }
            return true;

        }

        private static object GetBase64(string p) {
            var bytes = System.Text.Encoding.ASCII.GetBytes(p);
            return Convert.ToBase64String(bytes);
        }

        internal static Data.user GetUserFromLogin(string email, string password) {
            Data.user u = null;
            using(var ctx = new Data.FitathonDataEntities()) {
                try {
                    u = (from users in ctx.users
                         where users.email == email
                         && users.passwordHash == password
                         select users).SingleOrDefault();

                } catch { }
            }
            return u;
        }

        internal static Data.user GetUserFromEmail(FitathonDataEntities ctx, string email) {
            Data.user u = null;
            try {
                u = (from users in ctx.users
                     where users.email == email
                     select users).SingleOrDefault();

            } catch { }
            return u;
        }

        static internal Data.participant GetParticipantFromCode(string code) {
            Data.participant p = null;
            using(var ctx = new Data.FitathonDataEntities()) {

                try {
                    p = (from parts in ctx.participants
                         where parts.uniqueID == code
                         select parts).SingleOrDefault();

                } catch { }
            }
            return p;
        }

        internal static Data.participant GetParticipantFromCode(FitathonDataEntities ctx, string code) {
            Data.participant p = null;
            try {
                p = (from parts in ctx.participants
                     where parts.uniqueID == code
                     select parts).SingleOrDefault();

            } catch { }
            return p;
        }

        internal static int GetTodaysSteps(int participantId) {

            try {
                using(var ctx = new Data.FitathonDataEntities()) {
                    var part = (from parts in ctx.participants
                                where parts.id == participantId
                                select parts).SingleOrDefault();

                    if(part == null || string.IsNullOrEmpty(part.fitbitAuthCode)) {
                        return -1;
                    }
                    LoadTokensForParticipant(part.id, true); //refresh access token
                }

                //dispose of context to reload participant data, post token refresh

                using(var ctx = new Data.FitathonDataEntities()) {
                    var part = (from parts in ctx.participants
                                where parts.id == participantId
                                select parts).SingleOrDefault();
                    var url = "https://api.fitbit.com/1/user/-/activities/steps/date/today/1d.json";

                    var cli = new WebClient();
                    var req = WebRequest.Create(url);
                    req.Method = "GET";
                    req.Headers.Add("Authorization", string.Format("Bearer {0}", part.fitbitAccessToken));
                    req.ContentType = "application/x-www-form-urlencoded";

                    var resp = req.GetResponse();
                    using(var s = resp.GetResponseStream()) {
                        ActivitiesStepsCollection collection;
                        DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(ActivitiesStepsCollection));
                        collection = (ActivitiesStepsCollection)serializer.ReadObject(s);
                        var steps = collection.Steps.SingleOrDefault();
                        if(steps != null)
                            return steps.Value;
                    }

                    return -1;
                }
            } catch (Exception ex) {
                //HttpContext.Current.Response.Write(ex.ToString());
                return -1;
            }
        }

        [DataContract]
        private class ActivitiesStepsCollection {
            [DataMember(Name = "activities-steps")]
            public IEnumerable<ActivitiesStepsItem> Steps { get; set; }
        }
        
        [DataContract]
        private class ActivitiesStepsItem {
            [DataMember(Name = "dateTime")]
            public string Date { get; set; }
            [DataMember(Name = "value")]
            public int Value { get; set; }
        }

        private class FitbitTokenResponse {
            public string access_token = null;
            public int expires_in = 0;
            public string refresh_token = null;
            public string token_type = null;
            public string user_id = null;
            public string scope = null;
        }

    }
}
 