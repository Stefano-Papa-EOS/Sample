// This example shows one of the two methods that you have when you want to leverage the "Outb. Processor" queue from EOS Administration Library
// This method is the "interface-driven" method.
// In this case we will create the entry and tell it to be processed by a specifc handler codeunit that must implement the interface 'EOS004 IOutbQueueProcessor'
// This requires you to also extend the enum Enum::"EOS004 Proc. Queue Processor" and add your implementation to it.
// This method is 'cleaner' than the event-driven method, but it requires you to create a new enum value for each new implementation.

codeunit 50100 Mailing_Method1 implements "EOS004 IProcQueueProcessor"
{

    var
        OurCategoryNameTok: Label 'Customer Mail Method 1';

    internal procedure CategoryName(): Text[1024]
    begin
        exit(OurCategoryNameTok)
    end;

    // implements the interface
    // called for ever entry to be processed
    procedure Process(var OutbQueueEntry: Record "EOS004 Proc. Queue Entry");
    begin
        DoStuff(OutbQueueEntry);
    end;

    local procedure DoStuff(var OutbEntry: Record "EOS004 Proc. Queue Entry")
    begin
        // do stuff with the entry
    end;

}