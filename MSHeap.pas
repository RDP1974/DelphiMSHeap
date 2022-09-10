unit MSHeap;

// default MM override using Windows Heap API
// Roberto Della Pasqua www.dellapasqua.com
// previous code found publicily
// 10 sept 2022 added inline directive, zeromemory and freemem return value

{$O+}

interface

uses Windows;

implementation

var
  ProcessHeap: THandle;

function SysGetMem(Size: NativeInt): Pointer; inline;
begin
  Result := HeapAlloc(ProcessHeap, 0, Size);
end;

function SysFreeMem(P: Pointer): Integer; inline;
begin
  HeapFree(ProcessHeap, 0, P); //returns 0 if fail, but this can stop the execution
  Result:=0; //for Delphi management should be reversed to zero, else throws a runtime exception
end;

function SysReallocMem(P: Pointer; Size: NativeInt): Pointer; inline;
begin
  Result := HeapReAlloc(ProcessHeap, 0, P, Size);
end;

function SysAllocMem(Size: NativeInt): Pointer; inline;
begin
  Result := HeapAlloc(ProcessHeap, 8, Size); // zeromemory in dwflags api call
end;

function SysRegisterExpectedMemoryLeak(P: Pointer): Boolean;
begin
  Result := False;
end;

function SysUnregisterExpectedMemoryLeak(P: Pointer): Boolean;
begin
  Result := False;
end;

const
  MemoryManager: TMemoryManagerEx =
  (
  GetMem: SysGetmem;
  FreeMem: SysFreeMem;
  ReallocMem: SysReAllocMem;
  AllocMem: SysAllocMem;
  RegisterExpectedMemoryLeak: SysRegisterExpectedMemoryLeak;
  UnregisterExpectedMemoryLeak: SysUnregisterExpectedMemoryLeak
  );

initialization

ProcessHeap := GetProcessHeap;
SetMemoryManager(MemoryManager);

end.
