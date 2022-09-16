# DelphiMSHeap
Default MM override using Windows Heap API<br>
tested under win10, win2022, shows optimum performances both under single and multithreaded applications <br>
(quicker than intel tbbmalloc)<br>
how to replace the default MM:<br><br>
project -> view source<br>
program Test;<br>
uses<br>
MSHeap, // put the unit at the first uses<br>
..<br>
please see<br>
https://en.delphipraxis.net/topic/7357-64bit-rtl-patches-with-intel-oneapi-and-tbb/<br>
https://en.delphipraxis.net/topic/7357-64bit-rtl-patches-with-intel-oneapi-and-tbb/?tab=comments#comment-62867<br>
https://users.rust-lang.org/t/why-dont-windows-targets-use-malloc-instead-of-heapalloc/57936<br>
<br>
// 10 sept 2022 added inline directive, zeromemory and freemem return value<br>
<br>
kind regards<br>
Roberto Della Pasqua<br>
<br>
btw. below a test from DMVC author https://github.com/danieleteti/delphimvcframework<br><br>
Using default MM<br>
C:\WORK\Apache24\bin\ab.exe -c 100 -n 10000 http://localhost:8080/api<br>
Concurrency Level:      100<br>
Time taken for tests:   28.314 seconds<br>
Complete requests:      10000<br>
Failed requests:        0<br>
Total transferred:      1830000 bytes<br>
HTML transferred:       10000 bytes<br>
Requests per second:    <b><u>353.18</u></b> [#/sec] (mean) <br>
Time per request:       283.138 [ms] (mean)<br>
Time per request:       2.831 [ms] (mean, across all concurrent requests)<br>
Transfer rate:          63.12 [Kbytes/sec] received<br><br>
Using MSHeap<br>
C:\WORK\Apache24\bin\ab.exe -c 100 -n 10000 http://localhost:8080/api<br>
Concurrency Level:      100<br>
Time taken for tests:   2.054 seconds<br>
Complete requests:      10000<br>
Failed requests:        0<br>
Total transferred:      1830000 bytes<br>
HTML transferred:       10000 bytes<br>
Requests per second:    <b><u>4869.63</u></b> [#/sec] (mean) <br>
Time per request:       20.535 [ms] (mean)<br>
Time per request:       0.205 [ms] (mean, across all concurrent requests)<br>
Transfer rate:          870.26 [Kbytes/sec] received<br>
