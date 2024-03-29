﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="downloaddata.aspx.cs" Inherits="Analytics.downloaddata" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3 style="text-align:center; margin-top:2%;">Download data for off-line mode</h3>
    <div style="width: 100%; align-content: space-evenly; border: thin">
        <%--<p style="width: 100%; padding: 50px 0px 50px 50px;">--%>
        <p style="width: 100%; padding: 10px 0px 0px 50px;">
            <asp:Label ID="Label1" runat="server" Style="text-align: right" Text="Search Stock:"></asp:Label>
            <asp:TextBox ID="TextBoxSearch" runat="server" Width="10%" TabIndex="1"></asp:TextBox>
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <asp:Button ID="ButtonSearch" runat="server" Text="Search" TabIndex="2" OnClick="ButtonSearch_Click" />
            <asp:Label ID="Label3" runat="server"></asp:Label>
            <asp:DropDownList ID="DropDownListStock" runat="server" Width="50%" AutoPostBack="True" TabIndex="3" OnSelectedIndexChanged="DropDownListStock_SelectedIndexChanged"></asp:DropDownList>
            <asp:Label ID="Label9" runat="server"></asp:Label>
            <asp:Label ID="labelSelectedSymbol" runat="server" Width="50%" Text=""></asp:Label>
        </p>
        <p style="text-align: center">
            <asp:Button ID="buttonDownloadAll" runat="server" Text="Download All Functions" OnClick="buttonDownloadAll_Click" />
            <asp:Button ID="buttonDownloadSelected" runat="server" Text="Download Selected Functions" OnClick="buttonDownloadSelected_Click" />
            <asp:Button ID="buttonBack" runat="server" Text="Back" TabIndex="3" OnClick="buttonBack_Click" />
        </p>
    </div>
    <div style="width: 100%; height: auto; align-content: space-evenly; border:thin;">
        <asp:Table ID="Table1" runat="server" Width="100%" Height="100%" GridLines="Both">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell Text="Function Name" Width="20%"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="Parameters" Width="80%"></asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxQuote" Text="Get Quote" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <asp:Button ID="buttonGetQuote" runat="server" Text="Download" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxDaily" Text="Daily (Open/High/Low/Close/Volume)" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <asp:Label ID="Label4" runat="server" Text="Output size:" Width="8%"></asp:Label>
                    <asp:DropDownList ID="ddlDaily_OutputSize" runat="server" Width="10%" TabIndex="1">
                        <asp:ListItem Value="compact" Selected="True">Compact</asp:ListItem>
                        <asp:ListItem Value="full">Full</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxIntraday" Text="Intra-day (Open/High/Low/Close/Volume)" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <asp:Label ID="Label5" runat="server" Text="Interval:" Width="5%"></asp:Label>
                    <asp:DropDownList ID="ddlIntraday_Interval" runat="server" Width="10%" TabIndex="1">
                        <asp:ListItem Value="1min">1 min</asp:ListItem>
                        <asp:ListItem Value="5min" Selected="True">5 min</asp:ListItem>
                        <asp:ListItem Value="15min">15 min</asp:ListItem>
                        <asp:ListItem Value="30min">30 min</asp:ListItem>
                        <asp:ListItem Value="60min">60 min</asp:ListItem>
                        <%--<asp:ListItem Value="daily">Daily</asp:ListItem>
                    <asp:ListItem Value="weekly">Weekly</asp:ListItem>
                    <asp:ListItem Value="monthly">Monthly</asp:ListItem>--%>
                    </asp:DropDownList>
                    <asp:Label ID="Label6" runat="server" Text="Output size:" Width="10%"></asp:Label>
                    <asp:DropDownList ID="ddlIntraday_outputsize" runat="server" Width="10%" TabIndex="1">
                        <asp:ListItem Value="compact" Selected="True">Compact</asp:ListItem>
                        <asp:ListItem Value="full">Full</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxSMA" Text="SMA" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <asp:Label ID="Label7" runat="server" Text="Interval:" Width="5%"></asp:Label>
                    <asp:DropDownList ID="ddlSMA_Interval" runat="server" Width="8%" TabIndex="1">
                        <asp:ListItem Value="1min">1 min</asp:ListItem>
                        <asp:ListItem Value="5min">5 min</asp:ListItem>
                        <asp:ListItem Value="15min">15 min</asp:ListItem>
                        <asp:ListItem Value="30min">30 min</asp:ListItem>
                        <asp:ListItem Value="60min">60 min</asp:ListItem>
                        <asp:ListItem Value="daily" Selected="True">Daily</asp:ListItem>
                        <asp:ListItem Value="weekly">Weekly</asp:ListItem>
                        <asp:ListItem Value="monthly">Monthly</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label8" runat="server" Text="Period:" Width="5%"></asp:Label>
                    <asp:TextBox ID="textboxSMA_Period" runat="server" Width="5%" TextMode="Number" Text="20" TabIndex="2"></asp:TextBox>
                    <asp:Label ID="Label10" runat="server" Text="Series Type:" Width="9%"></asp:Label>
                    <asp:DropDownList ID="ddlSMA_Series" runat="server" Width="8%" TabIndex="3">
                        <asp:ListItem Value="open">Open</asp:ListItem>
                        <asp:ListItem Value="high">High</asp:ListItem>
                        <asp:ListItem Value="low">Low</asp:ListItem>
                        <asp:ListItem Value="close" Selected="True">Close</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxEMA" Text="EMA" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <asp:Label ID="Label11" runat="server" Text="Interval:" Width="5%"></asp:Label>
                    <asp:DropDownList ID="ddlEMA_Interval" runat="server" Width="8%" TabIndex="1">
                        <asp:ListItem Value="1min">1 min</asp:ListItem>
                        <asp:ListItem Value="5min">5 min</asp:ListItem>
                        <asp:ListItem Value="15min">15 min</asp:ListItem>
                        <asp:ListItem Value="30min">30 min</asp:ListItem>
                        <asp:ListItem Value="60min">60 min</asp:ListItem>
                        <asp:ListItem Value="daily" Selected="True">Daily</asp:ListItem>
                        <asp:ListItem Value="weekly">Weekly</asp:ListItem>
                        <asp:ListItem Value="monthly">Monthly</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label12" runat="server" Text="Period:" Width="5%"></asp:Label>
                    <asp:TextBox ID="textboxEMA_Period" runat="server" Width="5%" TextMode="Number" Text="20" TabIndex="2"></asp:TextBox>
                    <asp:Label ID="Label13" runat="server" Text="Series Type:" Width="9%"></asp:Label>
                    <asp:DropDownList ID="ddlEMA_Series" runat="server" Width="8%" TabIndex="3">
                        <asp:ListItem Value="open">Open</asp:ListItem>
                        <asp:ListItem Value="high">High</asp:ListItem>
                        <asp:ListItem Value="low">Low</asp:ListItem>
                        <asp:ListItem Value="close" Selected="True">Close</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxVWAP" Text="VWAP" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <asp:Label ID="Label14" runat="server" Text="Interval:" Width="5%"></asp:Label>
                    <asp:DropDownList ID="ddlVWAP_Interval" runat="server" Width="8%" TabIndex="1">
                        <asp:ListItem Value="1min">1 min</asp:ListItem>
                        <asp:ListItem Value="5min">5 min</asp:ListItem>
                        <asp:ListItem Value="15min">15 min</asp:ListItem>
                        <asp:ListItem Value="30min">30 min</asp:ListItem>
                        <asp:ListItem Value="60min">60 min</asp:ListItem>
                        <asp:ListItem Value="daily" Selected="True">Daily</asp:ListItem>
                        <asp:ListItem Value="weekly">Weekly</asp:ListItem>
                        <asp:ListItem Value="monthly">Monthly</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxRSI" Text="RSI" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <asp:Label ID="Label15" runat="server" Text="Interval:" Width="5%"></asp:Label>
                    <asp:DropDownList ID="ddlRSI_Interval" runat="server" Width="8%" TabIndex="1">
                        <asp:ListItem Value="1min">1 min</asp:ListItem>
                        <asp:ListItem Value="5min">5 min</asp:ListItem>
                        <asp:ListItem Value="15min">15 min</asp:ListItem>
                        <asp:ListItem Value="30min">30 min</asp:ListItem>
                        <asp:ListItem Value="60min">60 min</asp:ListItem>
                        <asp:ListItem Value="daily" Selected="True">Daily</asp:ListItem>
                        <asp:ListItem Value="weekly">Weekly</asp:ListItem>
                        <asp:ListItem Value="monthly">Monthly</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label16" runat="server" Text="Period:" Width="5%"></asp:Label>
                    <asp:TextBox ID="textboxRSI_Period" runat="server" Width="5%" TextMode="Number" Text="20" TabIndex="2"></asp:TextBox>
                    <asp:Label ID="Label17" runat="server" Text="Series Type:" Width="9%"></asp:Label>
                    <asp:DropDownList ID="ddlRSI_Series" runat="server" Width="8%" TabIndex="3">
                        <asp:ListItem Value="open">Open</asp:ListItem>
                        <asp:ListItem Value="high">High</asp:ListItem>
                        <asp:ListItem Value="low">Low</asp:ListItem>
                        <asp:ListItem Value="close" Selected="True">Close</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxSTOCH" Text="STOCH" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <p>
                        <asp:Label ID="Label18" runat="server" Text="Interval:" Width="5%"></asp:Label>
                        <asp:DropDownList ID="ddlSTOCH_Interval" runat="server" Width="8%" TabIndex="1">
                            <asp:ListItem Value="1min">1 min</asp:ListItem>
                            <asp:ListItem Value="5min">5 min</asp:ListItem>
                            <asp:ListItem Value="15min">15 min</asp:ListItem>
                            <asp:ListItem Value="30min">30 min</asp:ListItem>
                            <asp:ListItem Value="60min">60 min</asp:ListItem>
                            <asp:ListItem Value="daily" Selected="True">Daily</asp:ListItem>
                            <asp:ListItem Value="weekly">Weekly</asp:ListItem>
                            <asp:ListItem Value="monthly">Monthly</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label19" runat="server" Text="FastK Period:" Width="10%"></asp:Label>
                        <asp:TextBox ID="textboxSTOCH_Fastkperiod" runat="server" Width="4%" TextMode="Number" Text="5" TabIndex="2"></asp:TextBox>
                        <asp:Label ID="Label20" runat="server" Text="SlowK Period:" Width="10%"></asp:Label>
                        <asp:TextBox ID="textboxSTOCH_Slowkperiod" runat="server" Width="4%" TextMode="Number" Text="3" TabIndex="2"></asp:TextBox>
                        <asp:Label ID="Label21" runat="server" Text="SlowD Period:" Width="10%"></asp:Label>
                        <asp:TextBox ID="textboxSTOCH_Slowdperiod" runat="server" Width="4%" TextMode="Number" Text="3" TabIndex="2"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="Label22" runat="server" Text="SlowK MA Type:" Width="12%"></asp:Label>
                        <asp:DropDownList ID="ddlSTOCH_Slowkmatype" runat="server" Width="25%" TabIndex="3">
                            <asp:ListItem Value="0" Selected="True">Simple Moving Average (SMA)</asp:ListItem>
                            <asp:ListItem Value="1">Exponential Moving Average (EMA)</asp:ListItem>
                            <asp:ListItem Value="2">Weighted Moving Average (WMA)</asp:ListItem>
                            <asp:ListItem Value="3">Double Exponential Moving Average (DEMA)</asp:ListItem>
                            <asp:ListItem Value="4">Triple Exponential Moving Average (TEMA)</asp:ListItem>
                            <asp:ListItem Value="5">Triangular Moving Average (TRIMA)</asp:ListItem>
                            <asp:ListItem Value="6">T3 Moving Average</asp:ListItem>
                            <asp:ListItem Value="7">Kaufman Adaptive Moving Average (KAMA)</asp:ListItem>
                            <asp:ListItem Value="8">MESA Adaptive Moving Average (MAMA)</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label23" runat="server" Text="SlowD MA Type:" Width="12%"></asp:Label>
                        <asp:DropDownList ID="ddlSTOCH_Slowdmatype" runat="server" Width="25%" TabIndex="3">
                            <asp:ListItem Value="0" Selected="True">Simple Moving Average (SMA)</asp:ListItem>
                            <asp:ListItem Value="1">Exponential Moving Average (EMA)</asp:ListItem>
                            <asp:ListItem Value="2">Weighted Moving Average (WMA)</asp:ListItem>
                            <asp:ListItem Value="3">Double Exponential Moving Average (DEMA)</asp:ListItem>
                            <asp:ListItem Value="4">Triple Exponential Moving Average (TEMA)</asp:ListItem>
                            <asp:ListItem Value="5">Triangular Moving Average (TRIMA)</asp:ListItem>
                            <asp:ListItem Value="6">T3 Moving Average</asp:ListItem>
                            <asp:ListItem Value="7">Kaufman Adaptive Moving Average (KAMA)</asp:ListItem>
                            <asp:ListItem Value="8">MESA Adaptive Moving Average (MAMA)</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxMACD" Text="MACD" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <asp:Label ID="Label24" runat="server" Text="Interval:" Width="5%"></asp:Label>
                    <asp:DropDownList ID="ddlMACD_Interval" runat="server" Width="8%" TabIndex="1">
                        <asp:ListItem Value="1min">1 min</asp:ListItem>
                        <asp:ListItem Value="5min">5 min</asp:ListItem>
                        <asp:ListItem Value="15min">15 min</asp:ListItem>
                        <asp:ListItem Value="30min">30 min</asp:ListItem>
                        <asp:ListItem Value="60min">60 min</asp:ListItem>
                        <asp:ListItem Value="daily" Selected="True">Daily</asp:ListItem>
                        <asp:ListItem Value="weekly">Weekly</asp:ListItem>
                        <asp:ListItem Value="monthly">Monthly</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label25" runat="server" Text="Series Type:" Width="9%"></asp:Label>
                    <asp:DropDownList ID="ddlMACD_Series" runat="server" Width="8%" TabIndex="2">
                        <asp:ListItem Value="open">Open</asp:ListItem>
                        <asp:ListItem Value="high">High</asp:ListItem>
                        <asp:ListItem Value="low">Low</asp:ListItem>
                        <asp:ListItem Value="close" Selected="True">Close</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label26" runat="server" Text="Fast Period:" Width="9%"></asp:Label>
                    <asp:TextBox ID="textboxMACD_FastPeriod" runat="server" Width="4%" TextMode="Number" Text="12" TabIndex="3"></asp:TextBox>
                    <asp:Label ID="Label27" runat="server" Text="Slow Period:" Width="9%"></asp:Label>
                    <asp:TextBox ID="textboxMACD_SlowPeriod" runat="server" TextMode="Number" Width="4%" Text="26" TabIndex="4"></asp:TextBox>
                    <asp:Label ID="Label28" runat="server" Text="Signal Period:" Width="10%"></asp:Label>
                    <asp:TextBox ID="textboxMACD_SignalPeriod" runat="server" TextMode="Number" Width="4%" Text="9" TabIndex="5"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxAroon" Text="AROON" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <asp:Label ID="Label29" runat="server" Text="Interval:" Width="5%"></asp:Label>
                    <asp:DropDownList ID="ddlAroon_Interval" runat="server" Width="8%" TabIndex="1">
                        <asp:ListItem Value="1min">1 min</asp:ListItem>
                        <asp:ListItem Value="5min">5 min</asp:ListItem>
                        <asp:ListItem Value="15min">15 min</asp:ListItem>
                        <asp:ListItem Value="30min">30 min</asp:ListItem>
                        <asp:ListItem Value="60min">60 min</asp:ListItem>
                        <asp:ListItem Value="daily" Selected="True">Daily</asp:ListItem>
                        <asp:ListItem Value="weekly">Weekly</asp:ListItem>
                        <asp:ListItem Value="monthly">Monthly</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label30" runat="server" Text="Period:" Width="5%"></asp:Label>
                    <asp:TextBox ID="textboxAroon_Period" runat="server" Width="5%" TextMode="Number" Text="20" TabIndex="3"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxAdx" Text="ADX" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <asp:Label ID="Label31" runat="server" Text="Interval:" Width="5%"></asp:Label>
                    <asp:DropDownList ID="ddlAdx_Interval" runat="server" Width="8%" TabIndex="1">
                        <asp:ListItem Value="1min">1 min</asp:ListItem>
                        <asp:ListItem Value="5min">5 min</asp:ListItem>
                        <asp:ListItem Value="15min">15 min</asp:ListItem>
                        <asp:ListItem Value="30min">30 min</asp:ListItem>
                        <asp:ListItem Value="60min">60 min</asp:ListItem>
                        <asp:ListItem Value="daily" Selected="True">Daily</asp:ListItem>
                        <asp:ListItem Value="weekly">Weekly</asp:ListItem>
                        <asp:ListItem Value="monthly">Monthly</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label32" runat="server" Text="Period:" Width="5%"></asp:Label>
                    <asp:TextBox ID="textboxAdx_Period" runat="server" Width="5%" TextMode="Number" Text="20" TabIndex="2"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Width="20%">
                    <asp:CheckBox ID="checkboxBBands" Text="Bollinger Bands" runat="server" Font-Size="Smaller" />
                </asp:TableCell>
                <asp:TableCell Width="80%">
                    <p>
                        <asp:Label ID="Label33" runat="server" Text="Interval:" Width="5%"></asp:Label>
                        <asp:DropDownList ID="ddlBBands_Interval" runat="server" Width="8%" TabIndex="1">
                            <asp:ListItem Value="1min">1 min</asp:ListItem>
                            <asp:ListItem Value="5min">5 min</asp:ListItem>
                            <asp:ListItem Value="15min">15 min</asp:ListItem>
                            <asp:ListItem Value="30min">30 min</asp:ListItem>
                            <asp:ListItem Value="60min">60 min</asp:ListItem>
                            <asp:ListItem Value="daily" Selected="True">Daily</asp:ListItem>
                            <asp:ListItem Value="weekly">Weekly</asp:ListItem>
                            <asp:ListItem Value="monthly">Monthly</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label34" runat="server" Text="Period:" Width="5%"></asp:Label>
                        <asp:TextBox ID="textboxBBands_Period" runat="server" Width="5%" TextMode="Number" Text="20" TabIndex="2"></asp:TextBox>
                        <asp:Label ID="Label35" runat="server" Text="Series Type:" Width="9%"></asp:Label>
                        <asp:DropDownList ID="ddlBBands_Series" runat="server" Width="8%" TabIndex="3">
                            <asp:ListItem Value="open">Open</asp:ListItem>
                            <asp:ListItem Value="high">High</asp:ListItem>
                            <asp:ListItem Value="low">Low</asp:ListItem>
                            <asp:ListItem Value="close" Selected="True">Close</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                    <p>
                        <asp:Label ID="Label36" runat="server" Text="Deviation multiplier for upper band(nbDevUp):" Width="32%"></asp:Label>
                        <asp:TextBox ID="textboxBBands_NbdevUp" runat="server" TextMode="Number" Width="4%" Text="2" TabIndex="4"></asp:TextBox>
                        <asp:Label ID="Label37" runat="server" Text="Deviation multiplier for lower band(nbDevDn):" Width="32%"></asp:Label>
                        <asp:TextBox ID="textboxBBands_NbdevDn" runat="server" TextMode="Number" Width="4%" Text="2" TabIndex="5"></asp:TextBox>
                    </p>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    <div style="width: 100%; height: 100%; border: thin">
        <p>
            <asp:Label ID="textboxMessage" Width="100%" Height="100%" runat="server" Text="Label"></asp:Label>
        </p>
    </div>
</asp:Content>
