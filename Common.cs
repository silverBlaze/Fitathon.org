using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Fitathon.org.Data;

namespace Fitathon.org {
    public class Common {

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

        internal static object GetUserFromLogin(string email, string password) {
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

    }
}