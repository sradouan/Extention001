pageextension 50100 "Sales order Ext" extends "Sales Order"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Source of Sales"; "Source of Sales")
            {
                ApplicationArea = All;
                Importance = Promoted;

            }

        }
    }

    actions
    {
    }
}