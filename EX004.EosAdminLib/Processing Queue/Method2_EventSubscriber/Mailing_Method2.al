// This example shows one of the two methods that you have when you want to leverage the "Outb. Processor" queue from EOS Administration Library
// This method is the "event-driven" method.
// In this case we will create the entry and tell it to be processed by the generic handler 'Enum::"EOS004 Proc. Queue Processor"::Default'
// This handler does nothing but raise an event that you can subscribe to and provide the necessary logic to process the entry.

codeunit 50101 Mailing_Method2
{

    var
        OurCategoryNameTok: Label 'Customer Mail Method 2';

    internal procedure CategoryName(): Text[1024]
    begin
        exit(OurCategoryNameTok)
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EOS004 Proc. Queue - Default", 'OnProcessEntry', '', true, false)]
    local procedure OnProcessEntry(
        var OutbEntry: Record "EOS004 Proc. Queue Entry";
        var Handled: Boolean
    )
    begin
        // only react if this entry is ours
        if Handled or (OutbEntry."Category Name" <> OurCategoryNameTok) then exit;

        DoStuff(OutbEntry);

        // Always remember to set "Handled"
        // Entries that don't declare to be handled will be marked as failed.
        Handled := true;
    end;

    local procedure DoStuff(var OutbEntry: Record "EOS004 Proc. Queue Entry")
    begin
        // do stuff with the entry
    end;

}