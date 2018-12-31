pageextension 50102 "Posted SalesShipment Ext" extends "Posted Sales Shipments"
{
    layout
    {
        addafter("Shipment Date")
        {
            field("Source of Sales"; "Source of Sales")
            {
                ApplicationArea = All;
                Importance = Promoted;

            }

        }


    }
}