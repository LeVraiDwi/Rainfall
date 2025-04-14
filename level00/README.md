#Crack the code
##get the code
pour desassembler le binaire on utilise gdb:
```
gdb level0
desassemble main
```
on obtient le code suivant:
```
0x08048ec0 <+0>:	push   %ebp
0x08048ec1 <+1>:	mov    %esp,%ebp
0x08048ec3 <+3>:	and    $0xfffffff0,%esp
0x08048ec6 <+6>:	sub    $0x20,%esp
0x08048ec9 <+9>:	mov    0xc(%ebp),%eax
0x08048ecc <+12>:	add    $0x4,%eax
0x08048ecf <+15>:	mov    (%eax),%eax
0x08048ed1 <+17>:	mov    %eax,(%esp)
0x08048ed4 <+20>:	call   0x8049710 <atoi>
0x08048ed9 <+25>:	cmp    $0x1a7,%eax
0x08048ede <+30>:	jne    0x8048f58 <main+152>
0x08048ee0 <+32>:	movl   $0x80c5348,(%esp)
0x08048ee7 <+39>:	call   0x8050bf0 <strdup>
0x08048eec <+44>:	mov    %eax,0x10(%esp)
0x08048ef0 <+48>:	movl   $0x0,0x14(%esp)
0x08048ef8 <+56>:	call   0x8054680 <getegid>
0x08048efd <+61>:	mov    %eax,0x1c(%esp)
0x08048f01 <+65>:	call   0x8054670 <geteuid>
0x08048f06 <+70>:	mov    %eax,0x18(%esp)
0x08048f0a <+74>:	mov    0x1c(%esp),%eax
0x08048f0e <+78>:	mov    %eax,0x8(%esp)
0x08048f12 <+82>:	mov    0x1c(%esp),%eax
0x08048f16 <+86>:	mov    %eax,0x4(%esp)
0x08048f1a <+90>:	mov    0x1c(%esp),%eax
0x08048f1e <+94>:	mov    %eax,(%esp)
0x08048f21 <+97>:	call   0x8054700 <setresgid>
0x08048f26 <+102>:	mov    0x18(%esp),%eax
0x08048f2a <+106>:	mov    %eax,0x8(%esp)
0x08048f2e <+110>:	mov    0x18(%esp),%eax
0x08048f32 <+114>:	mov    %eax,0x4(%esp)
0x08048f36 <+118>:	mov    0x18(%esp),%eax
0x08048f3a <+122>:	mov    %eax,(%esp)
0x08048f3d <+125>:	call   0x8054690 <setresuid>
0x08048f42 <+130>:	lea    0x10(%esp),%eax
0x08048f46 <+134>:	mov    %eax,0x4(%esp)
0x08048f4a <+138>:	movl   $0x80c5348,(%esp)
0x08048f51 <+145>:	call   0x8054640 <execv>
0x08048f56 <+150>:	jmp    0x8048f80 <main+192>
0x08048f58 <+152>:	mov    0x80ee170,%eax
0x08048f5d <+157>:	mov    %eax,%edx
0x08048f5f <+159>:	mov    $0x80c5350,%eax
0x08048f64 <+164>:	mov    %edx,0xc(%esp)
0x08048f68 <+168>:	movl   $0x5,0x8(%esp)
0x08048f70 <+176>:	movl   $0x1,0x4(%esp)
0x08048f78 <+184>:	mov    %eax,(%esp)
0x08048f7b <+187>:	call   0x804a230 <fwrite>
0x08048f80 <+192>:	mov    $0x0,%eax
0x08048f85 <+197>:	leave  
0x08048f86 <+198>:	ret
```

## inspect the code

```
0x08048ec0 <+0>:	push   %ebp
0x08048ec1 <+1>:	mov    %esp,%ebp
```
sauvegarde l'etat de ebp sur la Stack, et setup et donne ebp le pointeur du haut de la stack
```
0x08048ec6 <+6>:	sub    $0x20,%esp
```
aloue 32 bytes sur la stack.
```
0x08048ec9 <+9>:	mov    0xc(%ebp),%eax
0x08048ecc <+12>:	add    $0x4,%eax
```
fait pointer eax sur argv[1]
```
0x08048ed1 <+17>:	mov    %eax,(%esp)
0x08048ed4 <+20>:	call   0x8049710 <atoi>
0x08048ed9 <+25>:	cmp    $0x1a7,%eax
```
place argv1 dans le premiere argument de atoi
puis compare le resultat de atoi a 0x1a7 => 423
si la valeur est differente ecrit "No" et quite le programme
sinon:
```
0x08048ee0 <+32>:	movl   $0x80c5348,(%esp)
0x08048ee7 <+39>:	call   0x8050bf0 <strdup>
0x08048eec <+44>:	mov    %eax,0x10(%esp)
0x08048ef0 <+48>:	movl   $0x0,0x14(%esp)
0x08048ef8 <+56>:	call   0x8054680 <getegid>
0x08048efd <+61>:	mov    %eax,0x1c(%esp)
0x08048f01 <+65>:	call   0x8054670 <geteuid>
0x08048f06 <+70>:	mov    %eax,0x18(%esp)
0x08048f0a <+74>:	mov    0x1c(%esp),%eax
0x08048f0e <+78>:	mov    %eax,0x8(%esp)
0x08048f12 <+82>:	mov    0x1c(%esp),%eax
```
get l' id et le uid du user et lui donne les droit de lire et executer des programme
```
0x08048f42 <+130>:	lea    0x10(%esp),%eax
0x08048f46 <+134>:	mov    %eax,0x4(%esp)
0x08048f4a <+138>:	movl   $0x80c5348,(%esp)
0x08048f51 <+145>:	call   0x8054640 <execv>
```
appelle la fonction execv avec comme argument un chaine de charactaire stocker a l' addresse 0x80c5348
pour connaitre la valeur de la chaine on peut utilise gdb
```
x/c 0x80c5348
```
le resutat est "/bin/sh" 
On comprend donc que un terminal avec les droit de lecture seras ouvert si on passe en argument "423"
Il ne reste plus qu'q aller lire le fichier
```
cat /home/user/level01/.pass
```