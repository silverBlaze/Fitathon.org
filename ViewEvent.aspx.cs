using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Fitathon.org {
    public partial class ViewEvent : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {


            bool isParticipant;
            EventState eventState;

            var email = Context.User.Identity.Name;
            using(var ctx = new Data.FitathonDataEntities()) {
                var user = (from u in ctx.users
                            where u.email == email
                            select u).SingleOrDefault();

                if(user != null) {
                    isParticipant = (user.participants != null && user.participants.Count > 0);
                    eventState = GetEventState(user);
                    Data.participant part;
                    Data.fitevent evt;
                    Data.sponsor sponsor = null;
                    Data.sponsor[] sponsors = null;
                    if(isParticipant) {
                        part = user.participants.SingleOrDefault();
                    } else {
                        sponsor = user.sponsors.SingleOrDefault();
                        part = sponsor.participant;
                    }
                    sponsors = part.sponsors != null ? part.sponsors.ToArray() : null;
                    evt = part.fitevent;
                    UpdateDisplay(user, part, evt, sponsor, sponsors, isParticipant, eventState);
                }
            }

        }

        private void UpdateDisplay(Data.user user, Data.participant part, Data.fitevent evt, Data.sponsor sponsor, Data.sponsor[] sponsors, bool isParticipant, EventState eventState) {
            litEventName.Text = evt.name;
            litBegins.Text = string.Format("{0:MM/dd/yy}", evt.begins);
            litEnds.Text = string.Format("{0:MM/dd/yy}", evt.ends);

            phSponsors.Visible = isParticipant;
            btnSettleEvent.Enabled = !evt.settled;
            phPledge.Visible = (!isParticipant && !evt.settled);
            phDonation.Visible = (!isParticipant && evt.settled);
            if(!isParticipant) {
                if(!evt.settled) {
                    litPledgeAmount.Text = string.Format("{0:c}", sponsor.pledgeAmount);
                    litPledgeUnit.Text = sponsor.pledgePerSteps.ToString();
                    litDonationMax.Text = string.Format("{0:c}", sponsor.donationMax);
                    litPayMethodType.Text = sponsor.payMethodType;
                } else {
                    var donation = sponsor.donations.SingleOrDefault();
                    if(donation != null) {
                        litDonationAmount.Text = string.Format("{0:c}", donation.amount);
                    } else {
                        //TODO: Display something to indicate that transaction failed
                    }
                }
            }
            switch(eventState) {
                case EventState.Before:
                    phBeforeTop.Visible = true;
                    litEstSteps.Text = evt.estimatedSteps.ToString();
                    phStepsToMax.Visible = isParticipant;
                    litStepsToMax.Text = CalcStepsToMaxDonation(evt, sponsors);
                    litEstDonations.Text = CalcEstDonations(evt, sponsors);
                    phMaxDonations.Visible = isParticipant;
                    litMaxDonations.Text = CalcMaxDonations(evt, sponsors);

                    if(isParticipant) {
                        PopulateSponsorPledgeList(phSponsors, sponsors);
                    } else {
                    }
                    break;
                case EventState.During:
                    phDuringTop.Visible = true;
                    litRaisedDuring.Text = CalcRaised(part, evt, sponsors);
                    litEstDonationsDuring.Text = CalcEstDonations(evt, sponsors);
                    litStepsDuring.Text = part.stepsTaken.ToString();
                    litEstStepsDuring.Text = evt.estimatedSteps.ToString();
                    litPercentToGoalDuring.Text = CalcPercentToGoal(part, evt);
                    litTimeRemaining.Text = CalcTimeRemaining(evt);

                    if(isParticipant) {
                        PopulateSponsorPledgeList(phSponsors, sponsors);
                    } else {
                    }
                    break;
                case EventState.After:
                    phAfterTop.Visible = true;
                    litRaisedAfter.Text = CalcRaised(part, evt, sponsors);
                    litStepsAfter.Text = part.stepsTaken.ToString();
                    litPercentToGoalAfter.Text = CalcPercentToGoal(part, evt);
                    litSuccessMessage.Text = GetSuccessMessage(isParticipant, part, evt, sponsors);
                    litSettlementStatus.Text = GetSettlementStatus(evt, sponsors);

                    if(isParticipant) {
                        if(evt.settled)
                            PopulateSponsorDonationList(phSponsors, sponsors);
                        else
                            PopulateSponsorPledgeList(phSponsors, sponsors);
                    } else {
                    }
                    break;
            }
        }

        private void PopulateSponsorDonationList(PlaceHolder phSponsors, Data.sponsor[] sponsors) {
            Data.donation d;
            using(var ul = new HtmlGenericControl("ul")) {
                foreach(var s in sponsors) {
                    using(var li = new HtmlGenericControl("li")) {
                        d = s.donations.SingleOrDefault();
                        ul.InnerHtml = string.Format("{0} - {1:c} collected", s.user.name, d != null ? d.amount : 0);
                        ul.Controls.Add(li);
                    }
                }
                phSponsorList.Controls.Add(ul);
            }
        }

        private void PopulateSponsorPledgeList(PlaceHolder phSponsors, Data.sponsor[] sponsors) {
            string maxMsg;
            using(var ul = new HtmlGenericControl("ul")) {
                foreach(var s in sponsors) {
                    using(var li = new HtmlGenericControl("li")) {
                        maxMsg = s.donationMax.HasValue ? string.Format(" ({0:c} max)", s.donationMax) : string.Empty;
                        li.InnerHtml = string.Format("{0} - {1:c}/{2} steps{3}", s.user.name, s.pledgeAmount, s.pledgePerSteps, maxMsg);
                        ul.Controls.Add(li);
                    }
                }
                phSponsorList.Controls.Add(ul);
            }
        }

        private string GetSettlementStatus(Data.fitevent evt, Data.sponsor[] sponsors) {
            if(evt.settled) {
                return "Event is settled";
            } else {
                return "Event is unsettled";
            }
        }

        private string GetSuccessMessage(bool isParticipant, Data.participant part, Data.fitevent evt, Data.sponsor[] sponsors) {
            decimal raised = 0;
            foreach(var s in sponsors) {
                if(s.pledgePerSteps.HasValue && s.pledgeAmount.HasValue)
                    raised += (part.stepsTaken / s.pledgePerSteps.Value) * s.pledgeAmount.Value;
            }
            var subject = isParticipant ? "You" : "We";
            var possAdjective = isParticipant ? "your" : "our";
            if(raised > evt.donationGoal.GetValueOrDefault())
                return string.Format("{0} beat {1} goal!", subject, possAdjective);
            else if(raised == evt.donationGoal.GetValueOrDefault())
                return string.Format("{0} met {1} goal!", subject, possAdjective);
            else if(raised > (evt.donationGoal.GetValueOrDefault() / 2))
                return string.Format("{0} almost met {1} goal!", subject, possAdjective);
            else
                return string.Format("{0} didn't meet {1} goal.", subject, possAdjective);
        }

        private string CalcTimeRemaining(Data.fitevent evt) {
            TimeSpan remains = evt.ends - DateTime.Now;
            var hours = (int)remains.TotalHours;
            return string.Format("{0} hours {1} minutes", hours, remains.Minutes);
        }

        private string CalcRaised(Data.participant part, Data.fitevent evt, Data.sponsor[] sponsors) {
            decimal raised = 0;
            foreach(var s in sponsors) {
                if(s.pledgePerSteps.HasValue && s.pledgeAmount.HasValue)
                    raised += (part.stepsTaken / s.pledgePerSteps.Value) * s.pledgeAmount.Value;
            }
            return string.Format("{0:c}", raised);
        }

        private string CalcPercentToGoal(Data.participant part, Data.fitevent evt) {
            if(evt.estimatedSteps.HasValue) {
                decimal percent = ((decimal)part.stepsTaken / (decimal)evt.estimatedSteps.Value) * 100;
                return Math.Round(percent).ToString();
            }
            return "0";
        }

        //sum up the maximum donations for an entire event
        private string CalcMaxDonations(Data.fitevent evt, Data.sponsor[] sponsors) {
            decimal max = 0;
            foreach(var s in sponsors) {
                if(s.donationMax.HasValue)
                    max += s.donationMax.Value;
                else
                    max += evt.estimatedSteps.GetValueOrDefault() * s.pledgeAmount.GetValueOrDefault();
            }
            return string.Format("{0:c}", max);
        }

        //sum up the Estimated donations for an entire event
        private string CalcEstDonations(Data.fitevent evt, Data.sponsor[] sponsors) {
            decimal est = 0;
            decimal temp = 0;
            foreach(var s in sponsors) {
                if(s.pledgePerSteps.HasValue) {
                    temp = (evt.estimatedSteps.GetValueOrDefault() / s.pledgePerSteps.Value) * s.pledgeAmount.GetValueOrDefault();
                    if(s.donationMax.HasValue && s.donationMax.Value < temp)
                        est += s.donationMax.Value;
                    else
                        est += temp;
                }
            }
            return string.Format("{0:c}", est);
        }

        //figure out the maximum number of steps required to max out all donations
        private string CalcStepsToMaxDonation(Data.fitevent evt, Data.sponsor[] sponsors) {
            int maxSteps = 0;
            int tempSteps = 0;
            if(sponsors.Length > 0) {
                foreach(var s in sponsors) {
                    if(s.donationMax.HasValue && s.pledgeAmount.HasValue && s.pledgePerSteps.HasValue) {
                        if(maxSteps == 0)
                            maxSteps = (int)((s.donationMax.Value / s.pledgeAmount.Value) * s.pledgePerSteps.Value);
                        tempSteps = (int)((s.donationMax.Value / s.pledgeAmount.Value) * s.pledgePerSteps.Value);
                        if(tempSteps > maxSteps)
                            maxSteps = tempSteps;
                    }
                }
            }
            if(maxSteps == 0)
                return "n/a";
            return maxSteps.ToString();
        }

        private EventState GetEventState(Data.user user) {
            var isParticipant = (user.participants != null && user.participants.Count > 0);
            Data.participant part;
            Data.sponsor sponsor;
            if(isParticipant) {
                part = user.participants.SingleOrDefault();
            } else {
                sponsor = user.sponsors.SingleOrDefault();
                part = sponsor.participant;
            }

            if(part != null) {
                var begins = part.fitevent.begins;
                var ends = part.fitevent.ends;

                if(begins > DateTime.Now)
                    return EventState.Before;
                else if(ends < DateTime.Now)
                    return EventState.After;
                return EventState.During;
            }
            return EventState.NoEvent;
        }

        private enum EventState {
            NoEvent = 0,
            Before,
            During,
            After
        }
    }
}