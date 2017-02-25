
_shutdown:     file format elf32-i386


Disassembly of section .text:

00000000 <shutdown>:
   stub functions for the system call user space wrapper functions are provided. 
   REMEMBER to disable the stub functions (by commenting the following macro) to 
   allow your implementation to work properly. */
//#define STUB_FUNCS
//#ifdef STUB_FUNCS
void shutdown(void) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
	halt_now();
   6:	e8 2f 03 00 00       	call   33a <halt_now>
}
   b:	90                   	nop
   c:	c9                   	leave  
   d:	c3                   	ret    

0000000e <main>:
//#endif


int 
main(int argc, char * argv[])
{
   e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  12:	83 e4 f0             	and    $0xfffffff0,%esp
  15:	ff 71 fc             	pushl  -0x4(%ecx)
  18:	55                   	push   %ebp
  19:	89 e5                	mov    %esp,%ebp
  1b:	51                   	push   %ecx
  1c:	83 ec 04             	sub    $0x4,%esp
    printf(1, "BYE~\n");
  1f:	83 ec 08             	sub    $0x8,%esp
  22:	68 ef 07 00 00       	push   $0x7ef
  27:	6a 01                	push   $0x1
  29:	e8 0b 04 00 00       	call   439 <printf>
  2e:	83 c4 10             	add    $0x10,%esp
    shutdown();
  31:	e8 ca ff ff ff       	call   0 <shutdown>
    exit(); //return 0;
  36:	e8 57 02 00 00       	call   292 <exit>

0000003b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	57                   	push   %edi
  3f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  40:	8b 4d 08             	mov    0x8(%ebp),%ecx
  43:	8b 55 10             	mov    0x10(%ebp),%edx
  46:	8b 45 0c             	mov    0xc(%ebp),%eax
  49:	89 cb                	mov    %ecx,%ebx
  4b:	89 df                	mov    %ebx,%edi
  4d:	89 d1                	mov    %edx,%ecx
  4f:	fc                   	cld    
  50:	f3 aa                	rep stos %al,%es:(%edi)
  52:	89 ca                	mov    %ecx,%edx
  54:	89 fb                	mov    %edi,%ebx
  56:	89 5d 08             	mov    %ebx,0x8(%ebp)
  59:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  5c:	90                   	nop
  5d:	5b                   	pop    %ebx
  5e:	5f                   	pop    %edi
  5f:	5d                   	pop    %ebp
  60:	c3                   	ret    

00000061 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  61:	55                   	push   %ebp
  62:	89 e5                	mov    %esp,%ebp
  64:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  67:	8b 45 08             	mov    0x8(%ebp),%eax
  6a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  6d:	90                   	nop
  6e:	8b 45 08             	mov    0x8(%ebp),%eax
  71:	8d 50 01             	lea    0x1(%eax),%edx
  74:	89 55 08             	mov    %edx,0x8(%ebp)
  77:	8b 55 0c             	mov    0xc(%ebp),%edx
  7a:	8d 4a 01             	lea    0x1(%edx),%ecx
  7d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  80:	0f b6 12             	movzbl (%edx),%edx
  83:	88 10                	mov    %dl,(%eax)
  85:	0f b6 00             	movzbl (%eax),%eax
  88:	84 c0                	test   %al,%al
  8a:	75 e2                	jne    6e <strcpy+0xd>
    ;
  return os;
  8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  8f:	c9                   	leave  
  90:	c3                   	ret    

00000091 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  94:	eb 08                	jmp    9e <strcmp+0xd>
    p++, q++;
  96:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  9a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	0f b6 00             	movzbl (%eax),%eax
  a4:	84 c0                	test   %al,%al
  a6:	74 10                	je     b8 <strcmp+0x27>
  a8:	8b 45 08             	mov    0x8(%ebp),%eax
  ab:	0f b6 10             	movzbl (%eax),%edx
  ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  b1:	0f b6 00             	movzbl (%eax),%eax
  b4:	38 c2                	cmp    %al,%dl
  b6:	74 de                	je     96 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  b8:	8b 45 08             	mov    0x8(%ebp),%eax
  bb:	0f b6 00             	movzbl (%eax),%eax
  be:	0f b6 d0             	movzbl %al,%edx
  c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  c4:	0f b6 00             	movzbl (%eax),%eax
  c7:	0f b6 c0             	movzbl %al,%eax
  ca:	29 c2                	sub    %eax,%edx
  cc:	89 d0                	mov    %edx,%eax
}
  ce:	5d                   	pop    %ebp
  cf:	c3                   	ret    

000000d0 <strlen>:

uint
strlen(char *s)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  d6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  dd:	eb 04                	jmp    e3 <strlen+0x13>
  df:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  e3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  e6:	8b 45 08             	mov    0x8(%ebp),%eax
  e9:	01 d0                	add    %edx,%eax
  eb:	0f b6 00             	movzbl (%eax),%eax
  ee:	84 c0                	test   %al,%al
  f0:	75 ed                	jne    df <strlen+0xf>
    ;
  return n;
  f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  f5:	c9                   	leave  
  f6:	c3                   	ret    

000000f7 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f7:	55                   	push   %ebp
  f8:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  fa:	8b 45 10             	mov    0x10(%ebp),%eax
  fd:	50                   	push   %eax
  fe:	ff 75 0c             	pushl  0xc(%ebp)
 101:	ff 75 08             	pushl  0x8(%ebp)
 104:	e8 32 ff ff ff       	call   3b <stosb>
 109:	83 c4 0c             	add    $0xc,%esp
  return dst;
 10c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 10f:	c9                   	leave  
 110:	c3                   	ret    

00000111 <strchr>:

char*
strchr(const char *s, char c)
{
 111:	55                   	push   %ebp
 112:	89 e5                	mov    %esp,%ebp
 114:	83 ec 04             	sub    $0x4,%esp
 117:	8b 45 0c             	mov    0xc(%ebp),%eax
 11a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 11d:	eb 14                	jmp    133 <strchr+0x22>
    if(*s == c)
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	0f b6 00             	movzbl (%eax),%eax
 125:	3a 45 fc             	cmp    -0x4(%ebp),%al
 128:	75 05                	jne    12f <strchr+0x1e>
      return (char*)s;
 12a:	8b 45 08             	mov    0x8(%ebp),%eax
 12d:	eb 13                	jmp    142 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 12f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	0f b6 00             	movzbl (%eax),%eax
 139:	84 c0                	test   %al,%al
 13b:	75 e2                	jne    11f <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 13d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 142:	c9                   	leave  
 143:	c3                   	ret    

00000144 <gets>:

char*
gets(char *buf, int max)
{
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 14a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 151:	eb 42                	jmp    195 <gets+0x51>
    cc = read(0, &c, 1);
 153:	83 ec 04             	sub    $0x4,%esp
 156:	6a 01                	push   $0x1
 158:	8d 45 ef             	lea    -0x11(%ebp),%eax
 15b:	50                   	push   %eax
 15c:	6a 00                	push   $0x0
 15e:	e8 47 01 00 00       	call   2aa <read>
 163:	83 c4 10             	add    $0x10,%esp
 166:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 169:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 16d:	7e 33                	jle    1a2 <gets+0x5e>
      break;
    buf[i++] = c;
 16f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 172:	8d 50 01             	lea    0x1(%eax),%edx
 175:	89 55 f4             	mov    %edx,-0xc(%ebp)
 178:	89 c2                	mov    %eax,%edx
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	01 c2                	add    %eax,%edx
 17f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 183:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 185:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 189:	3c 0a                	cmp    $0xa,%al
 18b:	74 16                	je     1a3 <gets+0x5f>
 18d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 191:	3c 0d                	cmp    $0xd,%al
 193:	74 0e                	je     1a3 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	8b 45 f4             	mov    -0xc(%ebp),%eax
 198:	83 c0 01             	add    $0x1,%eax
 19b:	3b 45 0c             	cmp    0xc(%ebp),%eax
 19e:	7c b3                	jl     153 <gets+0xf>
 1a0:	eb 01                	jmp    1a3 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1a2:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	01 d0                	add    %edx,%eax
 1ab:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ae:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1b1:	c9                   	leave  
 1b2:	c3                   	ret    

000001b3 <stat>:

int
stat(char *n, struct stat *st)
{
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b9:	83 ec 08             	sub    $0x8,%esp
 1bc:	6a 00                	push   $0x0
 1be:	ff 75 08             	pushl  0x8(%ebp)
 1c1:	e8 0c 01 00 00       	call   2d2 <open>
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1d0:	79 07                	jns    1d9 <stat+0x26>
    return -1;
 1d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d7:	eb 25                	jmp    1fe <stat+0x4b>
  r = fstat(fd, st);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	ff 75 0c             	pushl  0xc(%ebp)
 1df:	ff 75 f4             	pushl  -0xc(%ebp)
 1e2:	e8 03 01 00 00       	call   2ea <fstat>
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1ed:	83 ec 0c             	sub    $0xc,%esp
 1f0:	ff 75 f4             	pushl  -0xc(%ebp)
 1f3:	e8 c2 00 00 00       	call   2ba <close>
 1f8:	83 c4 10             	add    $0x10,%esp
  return r;
 1fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1fe:	c9                   	leave  
 1ff:	c3                   	ret    

00000200 <atoi>:

int
atoi(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 206:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 20d:	eb 25                	jmp    234 <atoi+0x34>
    n = n*10 + *s++ - '0';
 20f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 212:	89 d0                	mov    %edx,%eax
 214:	c1 e0 02             	shl    $0x2,%eax
 217:	01 d0                	add    %edx,%eax
 219:	01 c0                	add    %eax,%eax
 21b:	89 c1                	mov    %eax,%ecx
 21d:	8b 45 08             	mov    0x8(%ebp),%eax
 220:	8d 50 01             	lea    0x1(%eax),%edx
 223:	89 55 08             	mov    %edx,0x8(%ebp)
 226:	0f b6 00             	movzbl (%eax),%eax
 229:	0f be c0             	movsbl %al,%eax
 22c:	01 c8                	add    %ecx,%eax
 22e:	83 e8 30             	sub    $0x30,%eax
 231:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	0f b6 00             	movzbl (%eax),%eax
 23a:	3c 2f                	cmp    $0x2f,%al
 23c:	7e 0a                	jle    248 <atoi+0x48>
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	0f b6 00             	movzbl (%eax),%eax
 244:	3c 39                	cmp    $0x39,%al
 246:	7e c7                	jle    20f <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 248:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 259:	8b 45 0c             	mov    0xc(%ebp),%eax
 25c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 25f:	eb 17                	jmp    278 <memmove+0x2b>
    *dst++ = *src++;
 261:	8b 45 fc             	mov    -0x4(%ebp),%eax
 264:	8d 50 01             	lea    0x1(%eax),%edx
 267:	89 55 fc             	mov    %edx,-0x4(%ebp)
 26a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 26d:	8d 4a 01             	lea    0x1(%edx),%ecx
 270:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 273:	0f b6 12             	movzbl (%edx),%edx
 276:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 278:	8b 45 10             	mov    0x10(%ebp),%eax
 27b:	8d 50 ff             	lea    -0x1(%eax),%edx
 27e:	89 55 10             	mov    %edx,0x10(%ebp)
 281:	85 c0                	test   %eax,%eax
 283:	7f dc                	jg     261 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 285:	8b 45 08             	mov    0x8(%ebp),%eax
}
 288:	c9                   	leave  
 289:	c3                   	ret    

0000028a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28a:	b8 01 00 00 00       	mov    $0x1,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <exit>:
SYSCALL(exit)
 292:	b8 02 00 00 00       	mov    $0x2,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <wait>:
SYSCALL(wait)
 29a:	b8 03 00 00 00       	mov    $0x3,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <pipe>:
SYSCALL(pipe)
 2a2:	b8 04 00 00 00       	mov    $0x4,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <read>:
SYSCALL(read)
 2aa:	b8 05 00 00 00       	mov    $0x5,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <write>:
SYSCALL(write)
 2b2:	b8 10 00 00 00       	mov    $0x10,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <close>:
SYSCALL(close)
 2ba:	b8 15 00 00 00       	mov    $0x15,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <kill>:
SYSCALL(kill)
 2c2:	b8 06 00 00 00       	mov    $0x6,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <exec>:
SYSCALL(exec)
 2ca:	b8 07 00 00 00       	mov    $0x7,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <open>:
SYSCALL(open)
 2d2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <mknod>:
SYSCALL(mknod)
 2da:	b8 11 00 00 00       	mov    $0x11,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <unlink>:
SYSCALL(unlink)
 2e2:	b8 12 00 00 00       	mov    $0x12,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <fstat>:
SYSCALL(fstat)
 2ea:	b8 08 00 00 00       	mov    $0x8,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <link>:
SYSCALL(link)
 2f2:	b8 13 00 00 00       	mov    $0x13,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <mkdir>:
SYSCALL(mkdir)
 2fa:	b8 14 00 00 00       	mov    $0x14,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <chdir>:
SYSCALL(chdir)
 302:	b8 09 00 00 00       	mov    $0x9,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <dup>:
SYSCALL(dup)
 30a:	b8 0a 00 00 00       	mov    $0xa,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <getpid>:
SYSCALL(getpid)
 312:	b8 0b 00 00 00       	mov    $0xb,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <sbrk>:
SYSCALL(sbrk)
 31a:	b8 0c 00 00 00       	mov    $0xc,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <sleep>:
SYSCALL(sleep)
 322:	b8 0d 00 00 00       	mov    $0xd,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <uptime>:
SYSCALL(uptime)
 32a:	b8 0e 00 00 00       	mov    $0xe,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <enable_sched_trace>:
SYSCALL(enable_sched_trace)
 332:	b8 16 00 00 00       	mov    $0x16,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <halt_now>:
SYSCALL(halt_now)
 33a:	b8 17 00 00 00       	mov    $0x17,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <fork_winner>:
SYSCALL(fork_winner)
 342:	b8 18 00 00 00       	mov    $0x18,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <set_sched>:
SYSCALL(set_sched)
 34a:	b8 19 00 00 00       	mov    $0x19,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <tickets_owned>:
SYSCALL(tickets_owned)
 352:	b8 1a 00 00 00       	mov    $0x1a,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <transfer_tickets>:
SYSCALL(transfer_tickets)
 35a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 362:	55                   	push   %ebp
 363:	89 e5                	mov    %esp,%ebp
 365:	83 ec 18             	sub    $0x18,%esp
 368:	8b 45 0c             	mov    0xc(%ebp),%eax
 36b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 36e:	83 ec 04             	sub    $0x4,%esp
 371:	6a 01                	push   $0x1
 373:	8d 45 f4             	lea    -0xc(%ebp),%eax
 376:	50                   	push   %eax
 377:	ff 75 08             	pushl  0x8(%ebp)
 37a:	e8 33 ff ff ff       	call   2b2 <write>
 37f:	83 c4 10             	add    $0x10,%esp
}
 382:	90                   	nop
 383:	c9                   	leave  
 384:	c3                   	ret    

00000385 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	53                   	push   %ebx
 389:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 38c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 393:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 397:	74 17                	je     3b0 <printint+0x2b>
 399:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 39d:	79 11                	jns    3b0 <printint+0x2b>
    neg = 1;
 39f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a9:	f7 d8                	neg    %eax
 3ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3ae:	eb 06                	jmp    3b6 <printint+0x31>
  } else {
    x = xx;
 3b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3bd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3c0:	8d 41 01             	lea    0x1(%ecx),%eax
 3c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3c6:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3cc:	ba 00 00 00 00       	mov    $0x0,%edx
 3d1:	f7 f3                	div    %ebx
 3d3:	89 d0                	mov    %edx,%eax
 3d5:	0f b6 80 64 0a 00 00 	movzbl 0xa64(%eax),%eax
 3dc:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3e0:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3e6:	ba 00 00 00 00       	mov    $0x0,%edx
 3eb:	f7 f3                	div    %ebx
 3ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3f0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3f4:	75 c7                	jne    3bd <printint+0x38>
  if(neg)
 3f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3fa:	74 2d                	je     429 <printint+0xa4>
    buf[i++] = '-';
 3fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ff:	8d 50 01             	lea    0x1(%eax),%edx
 402:	89 55 f4             	mov    %edx,-0xc(%ebp)
 405:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 40a:	eb 1d                	jmp    429 <printint+0xa4>
    putc(fd, buf[i]);
 40c:	8d 55 dc             	lea    -0x24(%ebp),%edx
 40f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 412:	01 d0                	add    %edx,%eax
 414:	0f b6 00             	movzbl (%eax),%eax
 417:	0f be c0             	movsbl %al,%eax
 41a:	83 ec 08             	sub    $0x8,%esp
 41d:	50                   	push   %eax
 41e:	ff 75 08             	pushl  0x8(%ebp)
 421:	e8 3c ff ff ff       	call   362 <putc>
 426:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 429:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 42d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 431:	79 d9                	jns    40c <printint+0x87>
    putc(fd, buf[i]);
}
 433:	90                   	nop
 434:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 43f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 446:	8d 45 0c             	lea    0xc(%ebp),%eax
 449:	83 c0 04             	add    $0x4,%eax
 44c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 44f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 456:	e9 59 01 00 00       	jmp    5b4 <printf+0x17b>
    c = fmt[i] & 0xff;
 45b:	8b 55 0c             	mov    0xc(%ebp),%edx
 45e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 461:	01 d0                	add    %edx,%eax
 463:	0f b6 00             	movzbl (%eax),%eax
 466:	0f be c0             	movsbl %al,%eax
 469:	25 ff 00 00 00       	and    $0xff,%eax
 46e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 471:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 475:	75 2c                	jne    4a3 <printf+0x6a>
      if(c == '%'){
 477:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 47b:	75 0c                	jne    489 <printf+0x50>
        state = '%';
 47d:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 484:	e9 27 01 00 00       	jmp    5b0 <printf+0x177>
      } else {
        putc(fd, c);
 489:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 48c:	0f be c0             	movsbl %al,%eax
 48f:	83 ec 08             	sub    $0x8,%esp
 492:	50                   	push   %eax
 493:	ff 75 08             	pushl  0x8(%ebp)
 496:	e8 c7 fe ff ff       	call   362 <putc>
 49b:	83 c4 10             	add    $0x10,%esp
 49e:	e9 0d 01 00 00       	jmp    5b0 <printf+0x177>
      }
    } else if(state == '%'){
 4a3:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4a7:	0f 85 03 01 00 00    	jne    5b0 <printf+0x177>
      if(c == 'd'){
 4ad:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4b1:	75 1e                	jne    4d1 <printf+0x98>
        printint(fd, *ap, 10, 1);
 4b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4b6:	8b 00                	mov    (%eax),%eax
 4b8:	6a 01                	push   $0x1
 4ba:	6a 0a                	push   $0xa
 4bc:	50                   	push   %eax
 4bd:	ff 75 08             	pushl  0x8(%ebp)
 4c0:	e8 c0 fe ff ff       	call   385 <printint>
 4c5:	83 c4 10             	add    $0x10,%esp
        ap++;
 4c8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4cc:	e9 d8 00 00 00       	jmp    5a9 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4d1:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4d5:	74 06                	je     4dd <printf+0xa4>
 4d7:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4db:	75 1e                	jne    4fb <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e0:	8b 00                	mov    (%eax),%eax
 4e2:	6a 00                	push   $0x0
 4e4:	6a 10                	push   $0x10
 4e6:	50                   	push   %eax
 4e7:	ff 75 08             	pushl  0x8(%ebp)
 4ea:	e8 96 fe ff ff       	call   385 <printint>
 4ef:	83 c4 10             	add    $0x10,%esp
        ap++;
 4f2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4f6:	e9 ae 00 00 00       	jmp    5a9 <printf+0x170>
      } else if(c == 's'){
 4fb:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4ff:	75 43                	jne    544 <printf+0x10b>
        s = (char*)*ap;
 501:	8b 45 e8             	mov    -0x18(%ebp),%eax
 504:	8b 00                	mov    (%eax),%eax
 506:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 509:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 50d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 511:	75 25                	jne    538 <printf+0xff>
          s = "(null)";
 513:	c7 45 f4 f5 07 00 00 	movl   $0x7f5,-0xc(%ebp)
        while(*s != 0){
 51a:	eb 1c                	jmp    538 <printf+0xff>
          putc(fd, *s);
 51c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51f:	0f b6 00             	movzbl (%eax),%eax
 522:	0f be c0             	movsbl %al,%eax
 525:	83 ec 08             	sub    $0x8,%esp
 528:	50                   	push   %eax
 529:	ff 75 08             	pushl  0x8(%ebp)
 52c:	e8 31 fe ff ff       	call   362 <putc>
 531:	83 c4 10             	add    $0x10,%esp
          s++;
 534:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 538:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53b:	0f b6 00             	movzbl (%eax),%eax
 53e:	84 c0                	test   %al,%al
 540:	75 da                	jne    51c <printf+0xe3>
 542:	eb 65                	jmp    5a9 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 544:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 548:	75 1d                	jne    567 <printf+0x12e>
        putc(fd, *ap);
 54a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 54d:	8b 00                	mov    (%eax),%eax
 54f:	0f be c0             	movsbl %al,%eax
 552:	83 ec 08             	sub    $0x8,%esp
 555:	50                   	push   %eax
 556:	ff 75 08             	pushl  0x8(%ebp)
 559:	e8 04 fe ff ff       	call   362 <putc>
 55e:	83 c4 10             	add    $0x10,%esp
        ap++;
 561:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 565:	eb 42                	jmp    5a9 <printf+0x170>
      } else if(c == '%'){
 567:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 56b:	75 17                	jne    584 <printf+0x14b>
        putc(fd, c);
 56d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 570:	0f be c0             	movsbl %al,%eax
 573:	83 ec 08             	sub    $0x8,%esp
 576:	50                   	push   %eax
 577:	ff 75 08             	pushl  0x8(%ebp)
 57a:	e8 e3 fd ff ff       	call   362 <putc>
 57f:	83 c4 10             	add    $0x10,%esp
 582:	eb 25                	jmp    5a9 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 584:	83 ec 08             	sub    $0x8,%esp
 587:	6a 25                	push   $0x25
 589:	ff 75 08             	pushl  0x8(%ebp)
 58c:	e8 d1 fd ff ff       	call   362 <putc>
 591:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 594:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 597:	0f be c0             	movsbl %al,%eax
 59a:	83 ec 08             	sub    $0x8,%esp
 59d:	50                   	push   %eax
 59e:	ff 75 08             	pushl  0x8(%ebp)
 5a1:	e8 bc fd ff ff       	call   362 <putc>
 5a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5a9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5b4:	8b 55 0c             	mov    0xc(%ebp),%edx
 5b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ba:	01 d0                	add    %edx,%eax
 5bc:	0f b6 00             	movzbl (%eax),%eax
 5bf:	84 c0                	test   %al,%al
 5c1:	0f 85 94 fe ff ff    	jne    45b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5c7:	90                   	nop
 5c8:	c9                   	leave  
 5c9:	c3                   	ret    

000005ca <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5ca:	55                   	push   %ebp
 5cb:	89 e5                	mov    %esp,%ebp
 5cd:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5d0:	8b 45 08             	mov    0x8(%ebp),%eax
 5d3:	83 e8 08             	sub    $0x8,%eax
 5d6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d9:	a1 80 0a 00 00       	mov    0xa80,%eax
 5de:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5e1:	eb 24                	jmp    607 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e6:	8b 00                	mov    (%eax),%eax
 5e8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5eb:	77 12                	ja     5ff <free+0x35>
 5ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f3:	77 24                	ja     619 <free+0x4f>
 5f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f8:	8b 00                	mov    (%eax),%eax
 5fa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5fd:	77 1a                	ja     619 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 602:	8b 00                	mov    (%eax),%eax
 604:	89 45 fc             	mov    %eax,-0x4(%ebp)
 607:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60d:	76 d4                	jbe    5e3 <free+0x19>
 60f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 612:	8b 00                	mov    (%eax),%eax
 614:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 617:	76 ca                	jbe    5e3 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 619:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61c:	8b 40 04             	mov    0x4(%eax),%eax
 61f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 626:	8b 45 f8             	mov    -0x8(%ebp),%eax
 629:	01 c2                	add    %eax,%edx
 62b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62e:	8b 00                	mov    (%eax),%eax
 630:	39 c2                	cmp    %eax,%edx
 632:	75 24                	jne    658 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 634:	8b 45 f8             	mov    -0x8(%ebp),%eax
 637:	8b 50 04             	mov    0x4(%eax),%edx
 63a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63d:	8b 00                	mov    (%eax),%eax
 63f:	8b 40 04             	mov    0x4(%eax),%eax
 642:	01 c2                	add    %eax,%edx
 644:	8b 45 f8             	mov    -0x8(%ebp),%eax
 647:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 64a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64d:	8b 00                	mov    (%eax),%eax
 64f:	8b 10                	mov    (%eax),%edx
 651:	8b 45 f8             	mov    -0x8(%ebp),%eax
 654:	89 10                	mov    %edx,(%eax)
 656:	eb 0a                	jmp    662 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 658:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65b:	8b 10                	mov    (%eax),%edx
 65d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 660:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 662:	8b 45 fc             	mov    -0x4(%ebp),%eax
 665:	8b 40 04             	mov    0x4(%eax),%eax
 668:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 66f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 672:	01 d0                	add    %edx,%eax
 674:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 677:	75 20                	jne    699 <free+0xcf>
    p->s.size += bp->s.size;
 679:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67c:	8b 50 04             	mov    0x4(%eax),%edx
 67f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 682:	8b 40 04             	mov    0x4(%eax),%eax
 685:	01 c2                	add    %eax,%edx
 687:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 68d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 690:	8b 10                	mov    (%eax),%edx
 692:	8b 45 fc             	mov    -0x4(%ebp),%eax
 695:	89 10                	mov    %edx,(%eax)
 697:	eb 08                	jmp    6a1 <free+0xd7>
  } else
    p->s.ptr = bp;
 699:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 69f:	89 10                	mov    %edx,(%eax)
  freep = p;
 6a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a4:	a3 80 0a 00 00       	mov    %eax,0xa80
}
 6a9:	90                   	nop
 6aa:	c9                   	leave  
 6ab:	c3                   	ret    

000006ac <morecore>:

static Header*
morecore(uint nu)
{
 6ac:	55                   	push   %ebp
 6ad:	89 e5                	mov    %esp,%ebp
 6af:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6b2:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6b9:	77 07                	ja     6c2 <morecore+0x16>
    nu = 4096;
 6bb:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6c2:	8b 45 08             	mov    0x8(%ebp),%eax
 6c5:	c1 e0 03             	shl    $0x3,%eax
 6c8:	83 ec 0c             	sub    $0xc,%esp
 6cb:	50                   	push   %eax
 6cc:	e8 49 fc ff ff       	call   31a <sbrk>
 6d1:	83 c4 10             	add    $0x10,%esp
 6d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6d7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6db:	75 07                	jne    6e4 <morecore+0x38>
    return 0;
 6dd:	b8 00 00 00 00       	mov    $0x0,%eax
 6e2:	eb 26                	jmp    70a <morecore+0x5e>
  hp = (Header*)p;
 6e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ed:	8b 55 08             	mov    0x8(%ebp),%edx
 6f0:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f6:	83 c0 08             	add    $0x8,%eax
 6f9:	83 ec 0c             	sub    $0xc,%esp
 6fc:	50                   	push   %eax
 6fd:	e8 c8 fe ff ff       	call   5ca <free>
 702:	83 c4 10             	add    $0x10,%esp
  return freep;
 705:	a1 80 0a 00 00       	mov    0xa80,%eax
}
 70a:	c9                   	leave  
 70b:	c3                   	ret    

0000070c <malloc>:

void*
malloc(uint nbytes)
{
 70c:	55                   	push   %ebp
 70d:	89 e5                	mov    %esp,%ebp
 70f:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 712:	8b 45 08             	mov    0x8(%ebp),%eax
 715:	83 c0 07             	add    $0x7,%eax
 718:	c1 e8 03             	shr    $0x3,%eax
 71b:	83 c0 01             	add    $0x1,%eax
 71e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 721:	a1 80 0a 00 00       	mov    0xa80,%eax
 726:	89 45 f0             	mov    %eax,-0x10(%ebp)
 729:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 72d:	75 23                	jne    752 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 72f:	c7 45 f0 78 0a 00 00 	movl   $0xa78,-0x10(%ebp)
 736:	8b 45 f0             	mov    -0x10(%ebp),%eax
 739:	a3 80 0a 00 00       	mov    %eax,0xa80
 73e:	a1 80 0a 00 00       	mov    0xa80,%eax
 743:	a3 78 0a 00 00       	mov    %eax,0xa78
    base.s.size = 0;
 748:	c7 05 7c 0a 00 00 00 	movl   $0x0,0xa7c
 74f:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 752:	8b 45 f0             	mov    -0x10(%ebp),%eax
 755:	8b 00                	mov    (%eax),%eax
 757:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 75a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75d:	8b 40 04             	mov    0x4(%eax),%eax
 760:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 763:	72 4d                	jb     7b2 <malloc+0xa6>
      if(p->s.size == nunits)
 765:	8b 45 f4             	mov    -0xc(%ebp),%eax
 768:	8b 40 04             	mov    0x4(%eax),%eax
 76b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 76e:	75 0c                	jne    77c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 770:	8b 45 f4             	mov    -0xc(%ebp),%eax
 773:	8b 10                	mov    (%eax),%edx
 775:	8b 45 f0             	mov    -0x10(%ebp),%eax
 778:	89 10                	mov    %edx,(%eax)
 77a:	eb 26                	jmp    7a2 <malloc+0x96>
      else {
        p->s.size -= nunits;
 77c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77f:	8b 40 04             	mov    0x4(%eax),%eax
 782:	2b 45 ec             	sub    -0x14(%ebp),%eax
 785:	89 c2                	mov    %eax,%edx
 787:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 78d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 790:	8b 40 04             	mov    0x4(%eax),%eax
 793:	c1 e0 03             	shl    $0x3,%eax
 796:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 799:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 79f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a5:	a3 80 0a 00 00       	mov    %eax,0xa80
      return (void*)(p + 1);
 7aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ad:	83 c0 08             	add    $0x8,%eax
 7b0:	eb 3b                	jmp    7ed <malloc+0xe1>
    }
    if(p == freep)
 7b2:	a1 80 0a 00 00       	mov    0xa80,%eax
 7b7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7ba:	75 1e                	jne    7da <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7bc:	83 ec 0c             	sub    $0xc,%esp
 7bf:	ff 75 ec             	pushl  -0x14(%ebp)
 7c2:	e8 e5 fe ff ff       	call   6ac <morecore>
 7c7:	83 c4 10             	add    $0x10,%esp
 7ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7d1:	75 07                	jne    7da <malloc+0xce>
        return 0;
 7d3:	b8 00 00 00 00       	mov    $0x0,%eax
 7d8:	eb 13                	jmp    7ed <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e3:	8b 00                	mov    (%eax),%eax
 7e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7e8:	e9 6d ff ff ff       	jmp    75a <malloc+0x4e>
}
 7ed:	c9                   	leave  
 7ee:	c3                   	ret    
