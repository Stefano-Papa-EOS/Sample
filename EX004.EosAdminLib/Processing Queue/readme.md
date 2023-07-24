# What is this?

This is an example how to use the `Processing Queue` feature of EOS Administration Library.

This feature provides a generic framework for enqueuing entries for asynchronous processing (for example via job queue).

# Great. But why?

Because it streamlines different aspects of error handling, scheduling, logging and does not requires you to reinvent it again every time.

The processing queue provides the following benefits

- A single entry point for all asynchronous operations
- Success and failure log on every entry with full stack trace (in case of failure)
- "Batching" feature to process only a set number of records on every run (to split up long operations on lots of entries)
- Designed for being run and scheduled over the job queue
- Categorization of entries to (for example) allow processing one category every 10min and another every 2h a.s.o.


# Yeah sure, but why not use the job queue itself then?

Oh sure, you do. But the job queue and the task scheduling feature still requires you to
- Write a 