report 50101 MyDocumentReport
{

    Caption = 'MyDocumentReport';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Src/Reports/MyDocumentReport.rdlc';

    dataset
    {
        dataitem(Header; "Sales Header")
        {
            PrintOnlyIfDetail = true;
            column(DocNo; Header."No.")
            {

            }
            column(BilltoCustomerName; Header."Bill-to Customer No.")
            {

            }
            column(PostngDate; Header."Posting Date")
            {

            }
            dataitem(Line; "Sales Line")
            {
                DataItemLink = "Document No." = field ("No.");
                column(LineType; Line.Type)
                {

                }
                column(LineNo; Line."Line No.")
                {

                }
                column(LineDescription; Line.Description)
                {

                }
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


}