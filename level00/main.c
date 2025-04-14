int main(int argc ,char **argv)
{
  int i;
  char *str;
  int j;
  __uid_t id;
  __gid_t uid;
  
  i = atoi(*argv[1]);
  if (i == 0x1a7) { // si i == 423
    str = strdup("/bin/sh");
    j = 0;
    uid = getegid(); 
    id = geteuid();
    setresgid(uid,uid,uid); // change les effective uid par ceux du user
    setresuid(id,id,id); // change les effective uid par ceux du user
    execv("/bin/sh",&str); // lance un shell avec les id du user 
  }
  else {
    fwrite("No !\n",1,5,(FILE *)stderr);
  }
  return 0;
}