tableextension 50103 "Item Journal Line Extension" extends "Item Journal Line"
{
    fields
    {
        field(50000; "Source of Sales"; code[20])
        {
            //DataClassification = ToBeClassified;
            TableRelation = "Source of Sales".Code where (Blocked = const (false));

        }
    }

}