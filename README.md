# DelphiMSHeap
Default MM override using Windows Heap API

tested under win10, win2022, shows optimum performances both under single and multithreaded applications 

(quicker than intel tbbmalloc)

how to replace the default MM:

project -> view source

program Test;

uses

MSHeap, // put the unit at the first uses
  
  ..

please see

https://en.delphipraxis.net/topic/7357-64bit-rtl-patches-with-intel-oneapi-and-tbb/

https://en.delphipraxis.net/topic/7357-64bit-rtl-patches-with-intel-oneapi-and-tbb/?tab=comments#comment-62867

https://users.rust-lang.org/t/why-dont-windows-targets-use-malloc-instead-of-heapalloc/57936

// 10 sept 2022 added inline directive, zeromemory and freemem return value

kind regards

Roberto Della Pasqua


btw. below a test from DMVC author https://github.com/danieleteti/delphimvcframework
C:\WORK\Apache24\bin\ab.exe -c 100 -n 10000 http://localhost:8080/api
Benchmarking localhost (be patient)
...
Finished 10000 requests

Concurrency Level:      100
Time taken for tests:   28.314 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1830000 bytes
HTML transferred:       10000 bytes
>>> Requests per second:    353.18 [#/sec] (mean) <<<
Time per request:       283.138 [ms] (mean)
Time per request:       2.831 [ms] (mean, across all concurrent requests)
Transfer rate:          63.12 [Kbytes/sec] received
Using MSHeap
C:\WORK\Apache24\bin\ab.exe -c 100 -n 10000 http://localhost:8080/api
Benchmarking localhost (be patient)
...

Concurrency Level:      100
Time taken for tests:   2.054 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1830000 bytes
HTML transferred:       10000 bytes
>>> Requests per second:    4869.63 [#/sec] (mean) <<<
Time per request:       20.535 [ms] (mean)
Time per request:       0.205 [ms] (mean, across all concurrent requests)
Transfer rate:          870.26 [Kbytes/sec] received
