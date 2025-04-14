                               **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined main()
             undefined         <UNASSIGNED>   <RETURN>
             undefined4        Stack[-0x14]:4 local_14                                XREF[4]:     08048efd(W), 
                                                                                                   08048f0a(R), 
                                                                                                   08048f12(R), 
                                                                                                   08048f1a(R)  
             undefined4        Stack[-0x18]:4 local_18                                XREF[4]:     08048f06(W), 
                                                                                                   08048f26(R), 
                                                                                                   08048f2e(R), 
                                                                                                   08048f36(R)  
             undefined4        Stack[-0x1c]:4 local_1c                                XREF[1]:     08048ef0(W)  
             undefined4        Stack[-0x20]:4 local_20                                XREF[2]:     08048eec(W), 
                                                                                                   08048f42(*)  
             undefined4        Stack[-0x24]:4 local_24                                XREF[1]:     08048f64(W)  
             undefined4        Stack[-0x28]:4 local_28                                XREF[3]:     08048f0e(W), 
                                                                                                   08048f2a(W), 
                                                                                                   08048f68(W)  
             undefined4        Stack[-0x2c]:4 local_2c                                XREF[4]:     08048f16(W), 
                                                                                                   08048f32(W), 
                                                                                                   08048f46(W), 
                                                                                                   08048f70(W)  
             undefined4        Stack[-0x30]:4 local_30                                XREF[6]:     08048ed1(*), 
                                                                                                   08048ee0(*), 
                                                                                                   08048f1e(*), 
                                                                                                   08048f3a(*), 
                                                                                                   08048f4a(*), 
                                                                                                   08048f78(*)  
                             main                                            XREF[3]:     Entry Point(*), 
                                                                                          _start:08048dff(*), 080dea88(*)  
        08048ec0 55              PUSH       EBP

  
  
  PUSH       EBP
  MOV        EBP,ESP
  AND        ESP,0xfffffff0
  SUB        ESP,0x20
  MOV        EAX,dword ptr [EBP + Stack[0x8]]
  ADD        EAX,0x4                                          ; get argument
  MOV        EAX,dword ptr [EAX]
  MOV        dword ptr [ESP]=>local_30,EAX
  CALL       atoi                                             ;int atoi(char * __nptr)

  CMP        EAX,0x1a7

  JNZ        LAB_08048f58
  MOV        dword ptr [ESP]=>local_30,s_/bin/sh_080c5348     ;= "/bin/sh"

  CALL       strdup                                           ;char * strdup(char * __s)

  MOV        dword ptr [ESP + local_20],EAX
  MOV        dword ptr [ESP + local_1c],0x0


  CALL       getegid                                          ;__gid_t getegid(void)

  MOV        dword ptr [ESP + local_14],EAX
  CALL       geteuid                                         ; __uid_t geteuid(void)

  MOV        dword ptr [ESP + local_18],EAX
  MOV        EAX,dword ptr [ESP + local_14]
  MOV        dword ptr [ESP + local_28],EAX
  MOV        EAX,dword ptr [ESP + local_14]
  MOV        dword ptr [ESP + local_2c],EAX
  MOV        EAX,dword ptr [ESP + local_14]
  MOV        dword ptr [ESP]=>local_30,EAX
  CALL       setresgid                                        ;int setresgid(__gid_t __rgid, __

  MOV        EAX,dword ptr [ESP + local_18]
  MOV        dword ptr [ESP + local_28],EAX
  MOV        EAX,dword ptr [ESP + local_18]
  MOV        dword ptr [ESP + local_2c],EAX
  MOV        EAX,dword ptr [ESP + local_18]
  MOV        dword ptr [ESP]=>local_30,EAX
  CALL       setresuid                                        ;int setresuid(__uid_t __ruid, __

  LEA        EAX=>local_20,[ESP + 0x10]
  MOV        dword ptr [ESP + local_2c],EAX
  MOV        dword ptr [ESP]=>local_30,s_/bin/sh_080c5348     ;= "/bin/sh"

  CALL       execv                                            ;int execv(char * __path, char * 

  JMP        LAB_08048f80
  LAB_08048f58                                   ; XREF[1]:     08048ede(j)  
    MOV        EAX,[->_IO_2_1_stderr_]                          ;= 080ee7a0

    MOV        EDX,EAX
    MOV        EAX,s_No_!_080c5350                              ;= "No !\n"

    MOV        dword ptr [ESP + local_24],EDX=>_IO_2_1_stderr_  ;= FBAD2086h
    MOV        dword ptr [ESP + local_28],0x5


    MOV        dword ptr [ESP + local_2c],0x1


    MOV        dword ptr [ESP]=>local_30,EAX=>s_No_!_080c5350   ;= "No !\n"
    CALL       fwrite                                           ;size_t fwrite(void * __ptr, size

  LAB_08048f80                                   ; XREF[1]:     08048f56(j)  
    MOV        EAX,0x0

    LEAVE
    RET


