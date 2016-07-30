using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SDPFinal
{
    public partial class UserList : System.Web.UI.Page
    {
        string fnam = "89877";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                fnam = Session["Value"].ToString();
            }
            catch (Exception ex)
            {
                Response.Redirect("LogIn.aspx");
            }
            if (fnam == "89877")
            {
                Response.Redirect("LogIn.aspx");
            }
            else
            {
                nam_label.Text = fnam;
                

            }
        }

        

        protected void Loan_btn_Click(object sender, EventArgs e)
        {
            Session["Value"] = "" + fnam;
            Response.Redirect("Loan.aspx");
        }

        protected void Loan_refund_btn_Click(object sender, EventArgs e)
        {
            Session["Value"] = "" + fnam;
            Response.Redirect("LoanRefund.aspx");
        }

        protected void Expenses_btn_Click(object sender, EventArgs e)
        {
            Session["Value"] = "" + fnam;
            Response.Redirect("Expenses.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void Revenues_btn_Click(object sender, EventArgs e)
        {
            Session["Value"] = "" + fnam;
            Response.Redirect("Revenues.aspx");
        
        }
    }
}