Web Server in Awk{

        #gawk -f file
        BEGIN {
          x        = 1                         # script exits if x < 1
          port     = 8080                      # port number
          host     = "/inet/tcp/" port "/0/0"  # host string
          url      = "http://localhost:" port  # server url
          status   = 200                       # 200 == OK
          reason   = "OK"                      # server response
          RS = ORS = "\r\n"                    # header line terminators
          doc      = Setup()                   # html document
          len      = length(doc) + length(ORS) # length of document
          while (x) {
             if ($1 == "GET") RunApp(substr($2, 2))
             if (! x) break
             print "HTTP/1.0", status, reason |& host
             print "Connection: Close"        |& host
             print "Pragma: no-cache"         |& host
             print "Content-length:", len     |& host
             print ORS doc                    |& host
             close(host)     # close client connection
             host |& getline # wait for new client request
          }
          # server terminated...
          doc = Bye()
          len = length(doc) + length(ORS)
          print "HTTP/1.0", status, reason |& host
          print "Connection: Close"        |& host
          print "Pragma: no-cache"         |& host
          print "Content-length:", len     |& host
          print ORS doc                    |& host
          close(host)
        }

        function Setup() {
          tmp = "<html>\
          <head><title>Simple gawk server</title></head>\
          <body>\
          <p><a href=" url "/xterm>xterm</a>\
          <p><a href=" url "/xcalc>xcalc</a>\
          <p><a href=" url "/xload>xload</a>\
          <p><a href=" url "/exit>terminate script</a>\
          </body>\
          </html>"
          return tmp
        }

        function Bye() {
          tmp = "<html>\
          <head><title>Simple gawk server</title></head>\
          <body><p>Script Terminated...</body>\
          </html>"
          return tmp
        }

        function RunApp(app) {
          if (app == "xterm")  {system("xterm&"); return}
          if (app == "xcalc" ) {system("xcalc&"); return}
          if (app == "xload" ) {system("xload&"); return}
          if (app == "exit")   {x = 0}
        }

    }

}