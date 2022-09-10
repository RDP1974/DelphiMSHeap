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
