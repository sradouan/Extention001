pageextension 50104 "Customer Ledger Entries Ext" extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Currency Code")
        {
            field("Source of sales"; "Source of Sales")
            {
                ApplicationArea = All;

            }
        }
    }

}