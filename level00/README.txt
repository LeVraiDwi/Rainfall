undefined4 main(undefined4 param_1,int param_2)

{
  int iVar1;
  char *local_20;
  undefined4 local_1c;
  __uid_t local_18;
  __gid_t local_14;
  
  iVar1 = atoi(*(char **)(param_2 + 4));
  if (iVar1 == 0x1a7) {
    local_20 = strdup("/bin/sh");
    local_1c = 0;
    local_14 = getegid();
    local_18 = geteuid();
    setresgid(local_14,local_14,local_14);
    setresuid(local_18,local_18,local_18);
    execv("/bin/sh",&local_20);
  }
  else {
    fwrite("No !\n",1,5,(FILE *)stderr);
  }
  return 0;
}

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
        08048ec1 89 e5           MOV        EBP,ESP
        08048ec3 83 e4 f0        AND        ESP,0xfffffff0
        08048ec6 83 ec 20        SUB        ESP,0x20
        08048ec9 8b 45 0c        MOV        EAX,dword ptr [EBP + Stack[0x8]]
        08048ecc 83 c0 04        ADD        EAX,0x4
        08048ecf 8b 00           MOV        EAX,dword ptr [EAX]
        08048ed1 89 04 24        MOV        dword ptr [ESP]=>local_30,EAX
        08048ed4 e8 37 08        CALL       atoi                                             int atoi(char * __nptr)
                 00 00
        08048ed9 3d a7 01        CMP        EAX,0x1a7
                 00 00
        08048ede 75 78           JNZ        LAB_08048f58
        08048ee0 c7 04 24        MOV        dword ptr [ESP]=>local_30,s_/bin/sh_080c5348     = "/bin/sh"
                 48 53 0c 08
        08048ee7 e8 04 7d        CALL       strdup                                           char * strdup(char * __s)
                 00 00
        08048eec 89 44 24 10     MOV        dword ptr [ESP + local_20],EAX
        08048ef0 c7 44 24        MOV        dword ptr [ESP + local_1c],0x0
                 14 00 00 
                 00 00
        08048ef8 e8 83 b7        CALL       getegid                                          __gid_t getegid(void)
                 00 00
        08048efd 89 44 24 1c     MOV        dword ptr [ESP + local_14],EAX
        08048f01 e8 6a b7        CALL       geteuid                                          __uid_t geteuid(void)
                 00 00
        08048f06 89 44 24 18     MOV        dword ptr [ESP + local_18],EAX
        08048f0a 8b 44 24 1c     MOV        EAX,dword ptr [ESP + local_14]
        08048f0e 89 44 24 08     MOV        dword ptr [ESP + local_28],EAX
        08048f12 8b 44 24 1c     MOV        EAX,dword ptr [ESP + local_14]
        08048f16 89 44 24 04     MOV        dword ptr [ESP + local_2c],EAX
        08048f1a 8b 44 24 1c     MOV        EAX,dword ptr [ESP + local_14]
        08048f1e 89 04 24        MOV        dword ptr [ESP]=>local_30,EAX
        08048f21 e8 da b7        CALL       setresgid                                        int setresgid(__gid_t __rgid, __
                 00 00
        08048f26 8b 44 24 18     MOV        EAX,dword ptr [ESP + local_18]
        08048f2a 89 44 24 08     MOV        dword ptr [ESP + local_28],EAX
        08048f2e 8b 44 24 18     MOV        EAX,dword ptr [ESP + local_18]
        08048f32 89 44 24 04     MOV        dword ptr [ESP + local_2c],EAX
        08048f36 8b 44 24 18     MOV        EAX,dword ptr [ESP + local_18]
        08048f3a 89 04 24        MOV        dword ptr [ESP]=>local_30,EAX
        08048f3d e8 4e b7        CALL       setresuid                                        int setresuid(__uid_t __ruid, __
                 00 00
        08048f42 8d 44 24 10     LEA        EAX=>local_20,[ESP + 0x10]
        08048f46 89 44 24 04     MOV        dword ptr [ESP + local_2c],EAX
        08048f4a c7 04 24        MOV        dword ptr [ESP]=>local_30,s_/bin/sh_080c5348     = "/bin/sh"
                 48 53 0c 08
        08048f51 e8 ea b6        CALL       execv                                            int execv(char * __path, char * 
                 00 00
        08048f56 eb 28           JMP        LAB_08048f80
                             LAB_08048f58                                    XREF[1]:     08048ede(j)  
        08048f58 a1 70 e1        MOV        EAX,[->_IO_2_1_stderr_]                          = 080ee7a0
                 0e 08
        08048f5d 89 c2           MOV        EDX,EAX
        08048f5f b8 50 53        MOV        EAX,s_No_!_080c5350                              = "No !\n"
                 0c 08
        08048f64 89 54 24 0c     MOV        dword ptr [ESP + local_24],EDX=>_IO_2_1_stderr_  = FBAD2086h
        08048f68 c7 44 24        MOV        dword ptr [ESP + local_28],0x5
                 08 05 00 
                 00 00
        08048f70 c7 44 24        MOV        dword ptr [ESP + local_2c],0x1
                 04 01 00 
                 00 00
        08048f78 89 04 24        MOV        dword ptr [ESP]=>local_30,EAX=>s_No_!_080c5350   = "No !\n"
        08048f7b e8 b0 12        CALL       fwrite                                           size_t fwrite(void * __ptr, size
                 00 00
                             LAB_08048f80                                    XREF[1]:     08048f56(j)  
        08048f80 b8 00 00        MOV        EAX,0x0
                 00 00
        08048f85 c9              LEAVE
        08048f86 c3              RET
        08048f87 90              ??         90h
        08048f88 90              ??         90h
        08048f89 90              ??         90h
        08048f8a 90              ??         90h
        08048f8b 90              ??         90h
        08048f8c 90              ??         90h
        08048f8d 90              ??         90h
        08048f8e 90              ??         90h
        08048f8f 90              ??         90h


