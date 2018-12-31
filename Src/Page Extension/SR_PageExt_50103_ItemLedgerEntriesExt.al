pageextension 50103 "Item Ledger Entries Ext" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Entry Type")
        {
            field("Source of sales"; "Source of Sales")
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
    }
}