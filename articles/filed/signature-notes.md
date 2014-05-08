

http://stackoverflow.com/questions/17480044/how-to-install-the-current-version-of-go-in-ubuntu

https://github.com/demarque/taz/blob/master/main.go


  def doc_2_pdf_extract_pdf!(doc_or_docx_path)
    doc_2_pdf = Doc2Pdf.new(doc_or_docx_path)
    doc_2_pdf.process!

    if doc_2_pdf.success?
      escaped_output      = Docsplit::ESCAPE[desired_pdf_path]

      File.open(escaped_output, 'wb') { |f| f.print doc_2_pdf.pdf_body }
      return true
    else
      return nil
    end
  end

Turn this into a Go library.

doc2pdf go to covert the doc to a pdf
Taz server to server up the images.

1) doc2pdf - DONE
2) mudraw -o #{document.pngs_dir}/%d.png #{document.desired_pdf_path} #{sort}
3) 

Make web request with url of a PDF

Responds quickly with success.

Puts data into the database.

Separate system runs checking the database for anything new.

If it finds something new, that process, runs another process to convert the document to PNGs.

After that process is done, it fires a process to upload those PNGs.

After that process is done, it fires a process to create a web hook event to post that event data.

Maybe all these process should post events as they happen?

The cool thing about a web hook is that it will simply notify the service that something is happening. So upon completion of the PNGs then I could load the web page - that web page would simply be waiting for that event.

Everything would be evented base. Do something when an event fires. HTTP based events.






