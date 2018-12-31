tableextension 50102 "Sales Ship.Header Extension" extends "Sales Shipment Header"
{
    fields
    {
        field(50000; "Source Of Sales"; Code[20])
        {
            TableRelation = "Source of Sales".Code where (Blocked = const (false));
            Editable=false;
        }
    }

}