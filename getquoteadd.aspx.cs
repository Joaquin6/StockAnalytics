using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Analytics
{
    public partial class getquoteadd : System.Web.UI.Page
    {
        public string Symbol
        {
            get
            {
                if (DropDownListStock.SelectedIndex >= 0)
                    return DropDownListStock.SelectedValue;
                else
                    return "";
            }
        }
        public string CompanyName
        {
            get
            {
                if (DropDownListStock.SelectedIndex >= 0)
                    return (DropDownListStock.SelectedItem.Text.Split(':')[1]).Trim();
                else
                    return "";
            }
        }
        public string ExchangeCode
        {
            get
            {
                return textboxExch.Text.Trim();
            }
        }
        public string ExchangeDisplay
        {
            get
            {
                return textboxExchDisp.Text.Trim();
            }
        }
        public string InvestmentType
        {
            get
            {
                return textboxType.Text.Trim();
            }
        }
        public string InvestmentTypeDisplay
        {
            get
            {
                return textboxTypeDisp.Text.Trim();
            }
        }

        public string Price
        {
            get
            {
                return textboxPrice.Text;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["EmailId"] != null)
            //{
            //    Master.UserID = Session["emailid"].ToString();
            //}

            //if((Session["EmailId"] != null) && (Session["PortfolioName"] != null))
            if ((Session["EmailId"] != null))
            {
                //Master.Portfolio = Session["PortfolioName"].ToString();
                if (!IsPostBack)
                {
                    ViewState["FetchedData"] = null;

                    DropDownListStock.Items.Clear();

                    bool isAddAllowed = true;
                    if (Request.QueryString["addallowed"] != null)
                        isAddAllowed = System.Convert.ToBoolean(Request.QueryString["valuation"]);

                    if (isAddAllowed)
                    {
                        buttonAddStock.Enabled = true;
                    }
                    else
                    {
                        buttonAddStock.Enabled = false;
                    }

                }
            }
            else
            {
                //Response.Write("<script language=javascript>alert('" + common.noLogin + "')</script>");
                Page.ClientScript.RegisterStartupScript(GetType(), "myScript", "alert('" + common.noLogin + "');", true);
                Response.Redirect("~/Default.aspx");
            }
        }
        protected void buttonAddStock_Click(object sender, EventArgs e)
        {
            //Server.Transfer("~/addnewscript.aspx");
            if(this.MasterPageFile.Contains("Site.Master"))
                Response.Redirect("~/addnewscript.aspx?symbol=" + Symbol + "&price=" + Price + "&companyname=" + Server.UrlEncode(CompanyName) + "&exch=" + Server.UrlEncode(ExchangeCode)
                    + "&exchDisp=" + Server.UrlEncode(ExchangeDisplay) + "&type=" + Server.UrlEncode(InvestmentType) + "&typeDisp=" + Server.UrlEncode(InvestmentTypeDisplay));
            else if (this.MasterPageFile.Contains("Site.Mobile.Master"))
                Response.Redirect("~/maddnewscript.aspx?symbol=" + Symbol + "&price=" + Price + "&companyname=" + Server.UrlEncode(CompanyName) + "&exch=" + Server.UrlEncode(ExchangeCode)
                    + "&exchDisp=" + Server.UrlEncode(ExchangeDisplay) + "&type=" + Server.UrlEncode(InvestmentType) + "&typeDisp=" + Server.UrlEncode(InvestmentTypeDisplay));
            else
                Response.Redirect("~/maddnewscript.aspx?symbol=" + Symbol + "&price=" + Price + "&companyname=" + Server.UrlEncode(CompanyName) + "&exch=" + Server.UrlEncode(ExchangeCode)
                    + "&exchDisp=" + Server.UrlEncode(ExchangeDisplay) + "&type=" + Server.UrlEncode(InvestmentType) + "&typeDisp=" + Server.UrlEncode(InvestmentTypeDisplay));
        }
        protected void buttonGoBack_Click(object sender, EventArgs e)
        {
            if (this.MasterPageFile.Contains("Site.Master"))
                Response.Redirect("~/openportfolio.aspx");
            else if (this.MasterPageFile.Contains("Site.Mobile.Master"))
                Response.Redirect("~/mopenportfolio.aspx");
            else
                Response.Redirect("~/mopenportfolio.aspx");
        }
        protected void DropDownListStock_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListStock.SelectedIndex >= 0)
            {
                if(labelSelectedSymbol.Text.Equals(DropDownListStock.SelectedValue) == false)
                {
                    textboxOpen.Text = "";
                    textboxHigh.Text = "";
                    textboxLow.Text = "";
                    textboxPrice.Text = "";
                    textboxVolume.Text = "";
                    textboxLatestDay.Text = "";
                    textboxPrevClose.Text = "";
                    textboxChange.Text = "";
                    textboxChangePercent.Text = "";
                }
                labelSelectedSymbol.Text = DropDownListStock.SelectedValue;
                Session["ScriptName"] = DropDownListStock.SelectedValue;
                DataTable dt = (DataTable)ViewState["FetchedData"];
                DataRow[] scriptRows = dt.Select("Symbol='" + DropDownListStock.SelectedValue + "'");
                if ((scriptRows != null) && (scriptRows.Length > 0))
                {
                    textboxExch.Text = scriptRows[0]["Exchange"].ToString();
                    textboxExchDisp.Text = scriptRows[0]["ExchangeDisplay"].ToString();
                    textboxType.Text = scriptRows[0]["Type"].ToString();
                    textboxTypeDisp.Text = scriptRows[0]["TypeDisplay"].ToString();
                }

            }
            else
            {
                labelSelectedSymbol.Text = "Please select stock to get quote for";
            }
        }
        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            if (TextBoxSearch.Text.Length > 0)
            {
                //DataTable resultTable = StockApi.symbolSearch(TextBoxSearch.Text, apiKey: Session["ApiKey"].ToString());
                DataTable resultTable = StockApi.symbolSearchAltername(TextBoxSearch.Text, apiKey: Session["ApiKey"].ToString());
                if (resultTable != null)
                {
                    ViewState["FetchedData"] = resultTable;
                    DropDownListStock.DataTextField = "Name";
                    DropDownListStock.DataValueField = "Symbol";
                    DropDownListStock.DataSource = resultTable;
                    DropDownListStock.DataBind();
                    ListItem li = new ListItem("Select Stock", "-1");
                    DropDownListStock.Items.Insert(0, li);
                }
                else
                {
                    //Response.Write("<script language=javascript>alert('" + common.noSymbolFound + "')</script>");
                    Page.ClientScript.RegisterStartupScript(GetType(), "myScript", "alert('" + common.noSymbolFound + "');", true);
                }
            }
            else
            {
                //Response.Write("<script language=javascript>alert('" + common.noTextSearchSymbol+"')</script>");
                Page.ClientScript.RegisterStartupScript(GetType(), "myScript", "alert('" + common.noTextSearchSymbol + "');", true);
            }

        }
        protected void ButtonGetQuote_Click(object sender, EventArgs e)
        {
            string selectedSymbol = "";
            if (DropDownListStock.SelectedIndex >= 0)
            {
                string folderPath = Server.MapPath("~/scriptdata/");
                bool bIsTestOn = true;
                if (Session["IsTestOn"] != null)
                {
                    bIsTestOn = System.Convert.ToBoolean(Session["IsTestOn"]);
                }

                if (Session["TestDataFolder"] != null)
                {
                    folderPath = Session["TestDataFolder"].ToString();
                }

                selectedSymbol = DropDownListStock.SelectedValue;


                //DataTable quoteTable = StockApi.globalQuote(folderPath, selectedSymbol, bIsTestOn, apiKey: Session["ApiKey"].ToString());
                //will try to ALWAYS get quote from market 
                //DataTable quoteTable = StockApi.globalQuoteAlternate(folderPath, selectedSymbol, bIsTestOn, apiKey: Session["ApiKey"].ToString());
                DataTable quoteTable = StockApi.globalQuoteAlternate(folderPath, selectedSymbol, bIsTestModeOn:false, apiKey: Session["ApiKey"].ToString());
                //column names = symbol,open,high,low,price,volume,latestDay,previousClose,change,changePercent
                if (quoteTable != null)
                {
                    textboxOpen.Text = quoteTable.Rows[0]["open"].ToString();
                    textboxHigh.Text = quoteTable.Rows[0]["high"].ToString();
                    textboxLow.Text = quoteTable.Rows[0]["low"].ToString();
                    textboxPrice.Text = quoteTable.Rows[0]["price"].ToString();
                    textboxVolume.Text = quoteTable.Rows[0]["volume"].ToString();
                    textboxLatestDay.Text = quoteTable.Rows[0]["latestDay"].ToString();
                    textboxPrevClose.Text = quoteTable.Rows[0]["previousClose"].ToString();
                    textboxChange.Text = quoteTable.Rows[0]["change"].ToString();
                    textboxChangePercent.Text = quoteTable.Rows[0]["changePercent"].ToString();
                }
                else
                {
                    //Response.Write("<script language=javascript>alert('" + common.noQuoteAvailable + "')</script>");
                    Page.ClientScript.RegisterStartupScript(GetType(), "myScript", "alert('" + common.noQuoteAvailable + "');", true);
                }
            }
            else
            {
                //Response.Write("<script language=javascript>alert('"+ common.noStockSelectedToGetQuote +"')</script>");
                Page.ClientScript.RegisterStartupScript(GetType(), "myScript", "alert('" + common.noStockSelectedToGetQuote + "');", true);
            }

        }

    }
}