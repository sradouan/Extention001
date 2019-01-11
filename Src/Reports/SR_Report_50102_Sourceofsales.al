report 50102 "Source of sales"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Src/Reports/Sourceofsales.rdlc';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Item No.", "Location Code", "Posting Date";
            DataItemTableView = where ("Source of Sales" = filter (<> ''));
            column(Item_No_; "Item No.")
            {

            }
            column(Description; "Description")
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
                IncludeCaption = true;  //table field properties
            }
            column(Document_No_; "Document No.")
            {

            }
            column(Source_of_Sales; "Source of Sales")
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}