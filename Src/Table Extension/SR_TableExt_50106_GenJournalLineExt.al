tableextension 50106 "Gen. Journal Line Extension" extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Source of Sales"; code[20])
        {
            TableRelation = "Source of Sales".Code where (Blocked = const (false));
            Editable = false;

        }
    }

}