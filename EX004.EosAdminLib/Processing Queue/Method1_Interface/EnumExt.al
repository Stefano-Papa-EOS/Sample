enumextension 50100 MyEnumExtension extends "EOS004 Proc. Queue Processor"
{

    value(50100; "Customer Mailing Method1")
    {
        Implementation = "EOS004 IProcQueueProcessor" = Mailing_Method1;
    }

}