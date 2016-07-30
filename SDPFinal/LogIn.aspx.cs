using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace SDPFinal
{
    public partial class LogIn : System.Web.UI.Page
    {
        string td;
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime todayDate = DateTime.Today;
            td = Convert.ToString(todayDate);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (regpass.Text != regrepass.Text)
            {
                Label13.Text = "Password didn't match. Please try again.";

            }
            else if(regpass.Text == regrepass.Text && regusnam.Text!="" && regfname.Text!="" && regpass.Text!="")
            {
                int not = 0;
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("INSERT INTO LogIn (User_Name,Full_Name,Type,Date,Authenticated,Password) VALUES('" + regusnam.Text + "','" + regfname.Text + "','" + regftyp.Text + "','" + td + "','" + not + "','" + regpass.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Label13.Text = "Request Has been sent.";
            }
            else
                Label13.Text = "Please fill up all details.";
        }

        protected void Login_btn_Click(object sender, EventArgs e)
        {
            if(lps.Text!="" && lusn.Text!="")
            {
                string tik = "";
                int checker = 2;
                string pas="";
                string fun="";
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("Select * from LogIn where [User_Name]='" + lusn.Text + "'", con);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    tik = reader["Authenticated"].ToString();
                    pas = reader["Password"].ToString();
                    fun =  reader["Full_Name"].ToString();
                    checker = 3;
                }
                if (tik == "True")
                {
                    if(pas != lps.Text)
                    {
                        Label14.Text = "Password didn't match.";
                    }
                    else
                    {
                        Label14.Text = "You have successfully loggedin.Welcome " + fun;
                        Session["Value"] = "" + fun;
                        Response.Redirect("Expenses.aspx");
                    }
                    
                }
                else if(tik == "False")
                {
                    Label14.Text = "User is not Authenticated.";
                }
                else if(checker ==2)
                {
                    Label14.Text = "This UserName doesn't exist.";
                }
            }
            else
            {
                Label14.Text = "Please fill up log in details.";
            }
        }
    }
}