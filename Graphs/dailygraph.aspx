<%@ Page Title="Daily" Language="C#" MasterPageFile="~/graphs/standardgraphs.Master" AutoEventWireup="true" CodeBehind="dailygraph.aspx.cs" Inherits="Analytics.dailygraph" %>

<%@ MasterType VirtualPath="~/Graphs/standardgraphs.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderGraphs" runat="server">
    <asp:Chart ID="chartdailyGraph" runat="server" CssClass="chart" Visible="false" BorderlineColor="Black" BorderlineDashStyle="Solid"
        ImageType="Png" ImageLocation="~/chartimg/ChartPic_#SEQ(300,3)" ImageStorageMode="UseImageLocation" EnableViewState="True" OnClick="chartdailyGraph_Click"
        OnPreRender="chart_PreRender">
        <Legends>
            <asp:Legend Name="legendDaily" LegendItemOrder="SameAsSeriesOrder" Docking="Top" Alignment="Center" LegendStyle="Row"
                BorderDashStyle="Dash" BorderColor="Black" DockedToChartArea="NotSet" IsDockedInsideChartArea="false" Font="Microsoft Sans Serif, 8pt">
                <Position X="0" Y="0" Height="3" Width="100" Auto="false" />
            </asp:Legend>
        </Legends>
        <Series>
            <asp:Series Name="Open" XAxisType="Secondary" YAxisType="Primary" ChartType="Line" ChartArea="chartareaDaily" Legend="legendDaily"
                LegendText="Open"
                XValueMember="Date" XValueType="Date" YValueMembers="Open" YValueType="Double"
                PostBackValue="Open,#VALX,#VALY" ToolTip="Date:#VALX; Open:#VALY" LegendToolTip="Open Price Line">
            </asp:Series>
            <asp:Series Name="High" XAxisType="Secondary" YAxisType="Primary" ChartType="Line" ChartArea="chartareaDaily" Legend="legendDaily"
                LegendText="High"
                XValueMember="Date" XValueType="Date" YValueMembers="High" YValueType="Double"
                PostBackValue="High,#VALX,#VALY" ToolTip="Date:#VALX; High:#VALY" LegendToolTip="High Price Line">
            </asp:Series>
            <asp:Series Name="Low" XAxisType="Secondary" YAxisType="Primary" ChartType="Line" ChartArea="chartareaDaily" Legend="legendDaily"
                LegendText="Low"
                XValueMember="Date" XValueType="Date" YValueMembers="Low" YValueType="Double"
                PostBackValue="Low,#VALX,#VALY" ToolTip="Date:#VALX; Low:#VALY" LegendToolTip="Low Price Line">
            </asp:Series>
            <asp:Series Name="Close" XAxisType="Secondary" YAxisType="Primary" ChartType="Line" ChartArea="chartareaDaily" Legend="legendDaily"
                LegendText="Close"
                XValueMember="Date" XValueType="Date" YValueMembers="Close" YValueType="Double"
                PostBackValue="Close,#VALX,#VALY" ToolTip="Date:#VALX; Close:#VALY" LegendToolTip="Close Price Line">
            </asp:Series>
            <asp:Series Name="OHLC" XAxisType="Secondary" YAxisType="Primary" ChartType="Candlestick" ChartArea="chartareaDaily" Legend="legendDaily"
                LegendText="OHLC"
                XValueMember="Date" XValueType="Date" YValueMembers="High,Low,Open,Close" YValueType="Double"
                BorderColor="Black" Color="Black"
                PostBackValue="OHLC,#VALX,#VALY1,#VALY2,#VALY3,#VALY4" ToolTip="Date:#VALX; Open:#VALY3; High:#VALY1; Low:#VALY2; Close:#VALY4"
                LegendToolTip="OHLC Candlestick"
                CustomProperties="PriceDownColor=Blue, ShowOpenClose=Both, PriceUpColor=Red, OpenCloseStyle=Traingle">
            </asp:Series>
            <asp:Series Name="Volume" XAxisType="Primary" YAxisType="Primary" ChartType="Column" ChartArea="chartVolume" Legend="legendDaily"
                LegendText="Volume"
                XValueMember="Date" XValueType="Date" YValueMembers="Volume" YValueType="Auto"
                PostBackValue="Volume,#VALX,#VALY" ToolTip="Date:#VALX; Volume:#VALY" LegendToolTip="Daily Volume">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="chartareaDaily" AlignmentOrientation="Vertical">
                <Position Auto="false" X="0" Y="3" Height="50" Width="98" />
                <%--<AxisX>
                    <LabelStyle Enabled="false" />
                </AxisX>--%>
                <AxisX2 IsMarginVisible="false" IsLabelAutoFit="true" LabelAutoFitStyle="DecreaseFont" TitleFont="Microsoft Sans Serif, 5pt">
                    <LabelStyle Font="Microsoft Sans Serif, 8pt" IsEndLabelVisible="true" />
                </AxisX2>

                <AxisY Title="Open/High/Low/Close Values" TitleAlignment="Center" IsMarginVisible="false" IsLabelAutoFit="true" LabelAutoFitStyle="DecreaseFont"
                    TitleFont="Microsoft Sans Serif, 8pt" IsStartedFromZero="false">
                    <LabelStyle Font="Microsoft Sans Serif, 8pt" />
                </AxisY>
            </asp:ChartArea>
            <asp:ChartArea Name="chartVolume" AlignWithChartArea="chartareaDaily" AlignmentOrientation="Vertical"
                AlignmentStyle="PlotPosition">
                <Position Auto="false" X="0" Y="53" Height="47" Width="98" />
                <AxisX IsMarginVisible="false" IsLabelAutoFit="true" LabelAutoFitStyle="DecreaseFont" TitleFont="Microsoft Sans Serif, 8pt">
                    <LabelStyle Font="Microsoft Sans Serif, 8pt" IsEndLabelVisible="true" />
                </AxisX>
                <AxisY Title="Volume" TitleAlignment="Center" IsMarginVisible="false" IsLabelAutoFit="true" LabelAutoFitStyle="DecreaseFont"
                    TitleFont="Microsoft Sans Serif, 8pt" IsStartedFromZero="false">
                    <LabelStyle Font="Microsoft Sans Serif, 8pt" />
                </AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <hr />
    <div>
        <asp:GridView ID="GridViewDaily" Visible="false" runat="server" Width="100%" AutoGenerateColumns="False" HorizontalAlign="Center"
            AllowPaging="True" OnPageIndexChanging="GridViewDaily_PageIndexChanging"
            PagerSettings-Position="TopAndBottom" ShowHeaderWhenEmpty="True">
            <Columns>
                <asp:BoundField HeaderText="Date" DataField="Date" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Open" DataField="Open" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="High" DataField="High" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Low" DataField="Low" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Close" DataField="Close" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Volume" DataField="Volume" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
        </asp:GridView>
    </div>
</asp:Content>
