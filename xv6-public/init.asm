
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 c8 08 00 00       	push   $0x8c8
  19:	e8 3d 04 00 00       	call   45b <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 60 04 00 00       	call   493 <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 54 04 00 00       	call   493 <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 d0 08 00 00       	push   $0x8d0
  50:	6a 01                	push   $0x1
  52:	e8 19 05 00 00       	call   570 <printf>
    pid = fork();
  57:	e8 b7 03 00 00       	call   413 <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	85 c0                	test   %eax,%eax
    pid = fork();
  61:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	89 f6                	mov    %esi,%esi
  69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 ae 03 00 00       	call   423 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 0f 09 00 00       	push   $0x90f
  85:	6a 01                	push   $0x1
  87:	e8 e4 04 00 00       	call   570 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 e3 08 00 00       	push   $0x8e3
  98:	6a 01                	push   $0x1
  9a:	e8 d1 04 00 00       	call   570 <printf>
      exit();
  9f:	e8 77 03 00 00       	call   41b <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 44 0c 00 00       	push   $0xc44
  ab:	68 f6 08 00 00       	push   $0x8f6
  b0:	e8 9e 03 00 00       	call   453 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 f9 08 00 00       	push   $0x8f9
  bc:	6a 01                	push   $0x1
  be:	e8 ad 04 00 00       	call   570 <printf>
      exit();
  c3:	e8 53 03 00 00       	call   41b <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 c8 08 00 00       	push   $0x8c8
  d2:	e8 8c 03 00 00       	call   463 <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 c8 08 00 00       	push   $0x8c8
  e0:	e8 76 03 00 00       	call   45b <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	53                   	push   %ebx
  f4:	8b 45 08             	mov    0x8(%ebp),%eax
  f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  fa:	89 c2                	mov    %eax,%edx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 100:	83 c1 01             	add    $0x1,%ecx
 103:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 107:	83 c2 01             	add    $0x1,%edx
 10a:	84 db                	test   %bl,%bl
 10c:	88 5a ff             	mov    %bl,-0x1(%edx)
 10f:	75 ef                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 111:	5b                   	pop    %ebx
 112:	5d                   	pop    %ebp
 113:	c3                   	ret    
 114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 11a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	0f b6 19             	movzbl (%ecx),%ebx
 130:	84 c0                	test   %al,%al
 132:	75 1c                	jne    150 <strcmp+0x30>
 134:	eb 2a                	jmp    160 <strcmp+0x40>
 136:	8d 76 00             	lea    0x0(%esi),%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 140:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 143:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 146:	83 c1 01             	add    $0x1,%ecx
 149:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 14c:	84 c0                	test   %al,%al
 14e:	74 10                	je     160 <strcmp+0x40>
 150:	38 d8                	cmp    %bl,%al
 152:	74 ec                	je     140 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 154:	29 d8                	sub    %ebx,%eax
}
 156:	5b                   	pop    %ebx
 157:	5d                   	pop    %ebp
 158:	c3                   	ret    
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 160:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 162:	29 d8                	sub    %ebx,%eax
}
 164:	5b                   	pop    %ebx
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <strlen>:

uint
strlen(const char *s)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 176:	80 39 00             	cmpb   $0x0,(%ecx)
 179:	74 15                	je     190 <strlen+0x20>
 17b:	31 d2                	xor    %edx,%edx
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	83 c2 01             	add    $0x1,%edx
 183:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 187:	89 d0                	mov    %edx,%eax
 189:	75 f5                	jne    180 <strlen+0x10>
    ;
  return n;
}
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret    
 18d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 190:	31 c0                	xor    %eax,%eax
}
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    
 194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 19a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	89 d7                	mov    %edx,%edi
 1af:	fc                   	cld    
 1b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b2:	89 d0                	mov    %edx,%eax
 1b4:	5f                   	pop    %edi
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	89 f6                	mov    %esi,%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <strchr>:

char*
strchr(const char *s, char c)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 45 08             	mov    0x8(%ebp),%eax
 1c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1ca:	0f b6 10             	movzbl (%eax),%edx
 1cd:	84 d2                	test   %dl,%dl
 1cf:	74 1d                	je     1ee <strchr+0x2e>
    if(*s == c)
 1d1:	38 d3                	cmp    %dl,%bl
 1d3:	89 d9                	mov    %ebx,%ecx
 1d5:	75 0d                	jne    1e4 <strchr+0x24>
 1d7:	eb 17                	jmp    1f0 <strchr+0x30>
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e0:	38 ca                	cmp    %cl,%dl
 1e2:	74 0c                	je     1f0 <strchr+0x30>
  for(; *s; s++)
 1e4:	83 c0 01             	add    $0x1,%eax
 1e7:	0f b6 10             	movzbl (%eax),%edx
 1ea:	84 d2                	test   %dl,%dl
 1ec:	75 f2                	jne    1e0 <strchr+0x20>
      return (char*)s;
  return 0;
 1ee:	31 c0                	xor    %eax,%eax
}
 1f0:	5b                   	pop    %ebx
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <gets>:

char*
gets(char *buf, int max)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
 205:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 206:	31 f6                	xor    %esi,%esi
 208:	89 f3                	mov    %esi,%ebx
{
 20a:	83 ec 1c             	sub    $0x1c,%esp
 20d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 210:	eb 2f                	jmp    241 <gets+0x41>
 212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 218:	8d 45 e7             	lea    -0x19(%ebp),%eax
 21b:	83 ec 04             	sub    $0x4,%esp
 21e:	6a 01                	push   $0x1
 220:	50                   	push   %eax
 221:	6a 00                	push   $0x0
 223:	e8 0b 02 00 00       	call   433 <read>
    if(cc < 1)
 228:	83 c4 10             	add    $0x10,%esp
 22b:	85 c0                	test   %eax,%eax
 22d:	7e 1c                	jle    24b <gets+0x4b>
      break;
    buf[i++] = c;
 22f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 233:	83 c7 01             	add    $0x1,%edi
 236:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 239:	3c 0a                	cmp    $0xa,%al
 23b:	74 23                	je     260 <gets+0x60>
 23d:	3c 0d                	cmp    $0xd,%al
 23f:	74 1f                	je     260 <gets+0x60>
  for(i=0; i+1 < max; ){
 241:	83 c3 01             	add    $0x1,%ebx
 244:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 247:	89 fe                	mov    %edi,%esi
 249:	7c cd                	jl     218 <gets+0x18>
 24b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 24d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 250:	c6 03 00             	movb   $0x0,(%ebx)
}
 253:	8d 65 f4             	lea    -0xc(%ebp),%esp
 256:	5b                   	pop    %ebx
 257:	5e                   	pop    %esi
 258:	5f                   	pop    %edi
 259:	5d                   	pop    %ebp
 25a:	c3                   	ret    
 25b:	90                   	nop
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 260:	8b 75 08             	mov    0x8(%ebp),%esi
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	01 de                	add    %ebx,%esi
 268:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 26a:	c6 03 00             	movb   $0x0,(%ebx)
}
 26d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 270:	5b                   	pop    %ebx
 271:	5e                   	pop    %esi
 272:	5f                   	pop    %edi
 273:	5d                   	pop    %ebp
 274:	c3                   	ret    
 275:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	pushl  0x8(%ebp)
 28d:	e8 c9 01 00 00       	call   45b <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	pushl  0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 cc 01 00 00       	call   473 <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 92 01 00 00       	call   443 <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	89 f6                	mov    %esi,%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 11             	movsbl (%ecx),%edx
 2da:	8d 42 d0             	lea    -0x30(%edx),%eax
 2dd:	3c 09                	cmp    $0x9,%al
  n = 0;
 2df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2e4:	77 1f                	ja     305 <atoi+0x35>
 2e6:	8d 76 00             	lea    0x0(%esi),%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2f3:	83 c1 01             	add    $0x1,%ecx
 2f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 2fa:	0f be 11             	movsbl (%ecx),%edx
 2fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	5b                   	pop    %ebx
 306:	5d                   	pop    %ebp
 307:	c3                   	ret    
 308:	90                   	nop
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
 315:	8b 5d 10             	mov    0x10(%ebp),%ebx
 318:	8b 45 08             	mov    0x8(%ebp),%eax
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 db                	test   %ebx,%ebx
 320:	7e 14                	jle    336 <memmove+0x26>
 322:	31 d2                	xor    %edx,%edx
 324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 328:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 32c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 32f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 332:	39 d3                	cmp    %edx,%ebx
 334:	75 f2                	jne    328 <memmove+0x18>
  return vdst;
}
 336:	5b                   	pop    %ebx
 337:	5e                   	pop    %esi
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <writeBuffer>:

int writeBuffer(char* buff, char* va)
{
 340:	55                   	push   %ebp
  int x = 0;
 341:	31 c9                	xor    %ecx,%ecx
{
 343:	89 e5                	mov    %esp,%ebp
 345:	56                   	push   %esi
 346:	53                   	push   %ebx
 347:	8b 75 0c             	mov    0xc(%ebp),%esi
 34a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char* temp = va;
  while (*buff != '.')
 34d:	89 f0                	mov    %esi,%eax
 34f:	0f b6 13             	movzbl (%ebx),%edx
 352:	eb 09                	jmp    35d <writeBuffer+0x1d>
 354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  {
    if (*va == 'A')
 358:	80 38 41             	cmpb   $0x41,(%eax)
 35b:	74 13                	je     370 <writeBuffer+0x30>
  while (*buff != '.')
 35d:	80 fa 2e             	cmp    $0x2e,%dl
 360:	75 f6                	jne    358 <writeBuffer+0x18>
        va = temp;
      else
        va++;
    }
  }
  *va = '.';
 362:	c6 00 2e             	movb   $0x2e,(%eax)
  return 1;
}
 365:	b8 01 00 00 00       	mov    $0x1,%eax
 36a:	5b                   	pop    %ebx
 36b:	5e                   	pop    %esi
 36c:	5d                   	pop    %ebp
 36d:	c3                   	ret    
 36e:	66 90                	xchg   %ax,%ax
      x = (x + 1)%4096;
 370:	83 c1 01             	add    $0x1,%ecx
      *va = *buff;
 373:	88 10                	mov    %dl,(%eax)
      buff++;
 375:	83 c3 01             	add    $0x1,%ebx
        va++;
 378:	83 c0 01             	add    $0x1,%eax
 37b:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
 381:	0f 44 c6             	cmove  %esi,%eax
 384:	eb c9                	jmp    34f <writeBuffer+0xf>
 386:	8d 76 00             	lea    0x0(%esi),%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <readBuffer>:

int readBuffer(char* va)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
  int c = 0, x = 0;
 396:	31 f6                	xor    %esi,%esi
 398:	31 db                	xor    %ebx,%ebx
{
 39a:	83 ec 0c             	sub    $0xc,%esp
  char* temp = va;
  while (*va != '.')
 39d:	8b 7d 08             	mov    0x8(%ebp),%edi
 3a0:	0f be 07             	movsbl (%edi),%eax
 3a3:	3c 2e                	cmp    $0x2e,%al
 3a5:	74 40                	je     3e7 <readBuffer+0x57>
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  {
    if (*va != 'A')
 3b0:	3c 41                	cmp    $0x41,%al
 3b2:	74 fc                	je     3b0 <readBuffer+0x20>
    {
      printf(1,"%c", *va);
 3b4:	83 ec 04             	sub    $0x4,%esp
      x = (x+1)%4096;
      c++; 
      if (x == 0)
        va = temp;
      else
        va++;
 3b7:	83 c7 01             	add    $0x1,%edi
      c++; 
 3ba:	83 c3 01             	add    $0x1,%ebx
      printf(1,"%c", *va);
 3bd:	50                   	push   %eax
 3be:	68 18 09 00 00       	push   $0x918
 3c3:	6a 01                	push   $0x1
 3c5:	e8 a6 01 00 00       	call   570 <printf>
      x = (x+1)%4096;
 3ca:	8d 56 01             	lea    0x1(%esi),%edx
      *va = 'A';
 3cd:	c6 47 ff 41          	movb   $0x41,-0x1(%edi)
      if (x == 0)
 3d1:	83 c4 10             	add    $0x10,%esp
        va++;
 3d4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 3da:	0f 44 7d 08          	cmove  0x8(%ebp),%edi
 3de:	89 d6                	mov    %edx,%esi
  while (*va != '.')
 3e0:	0f be 07             	movsbl (%edi),%eax
 3e3:	3c 2e                	cmp    $0x2e,%al
 3e5:	75 c9                	jne    3b0 <readBuffer+0x20>
    }
  }
  printf(1,"\n");
 3e7:	83 ec 08             	sub    $0x8,%esp
 3ea:	68 16 09 00 00       	push   $0x916
 3ef:	6a 01                	push   $0x1
 3f1:	e8 7a 01 00 00       	call   570 <printf>
  printf(1,"The value of the counter is %d\n", c);
 3f6:	83 c4 0c             	add    $0xc,%esp
 3f9:	53                   	push   %ebx
 3fa:	68 1c 09 00 00       	push   $0x91c
 3ff:	6a 01                	push   $0x1
 401:	e8 6a 01 00 00       	call   570 <printf>
  return 1;
 406:	8d 65 f4             	lea    -0xc(%ebp),%esp
 409:	b8 01 00 00 00       	mov    $0x1,%eax
 40e:	5b                   	pop    %ebx
 40f:	5e                   	pop    %esi
 410:	5f                   	pop    %edi
 411:	5d                   	pop    %ebp
 412:	c3                   	ret    

00000413 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 413:	b8 01 00 00 00       	mov    $0x1,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <exit>:
SYSCALL(exit)
 41b:	b8 02 00 00 00       	mov    $0x2,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <wait>:
SYSCALL(wait)
 423:	b8 03 00 00 00       	mov    $0x3,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <pipe>:
SYSCALL(pipe)
 42b:	b8 04 00 00 00       	mov    $0x4,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <read>:
SYSCALL(read)
 433:	b8 05 00 00 00       	mov    $0x5,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <write>:
SYSCALL(write)
 43b:	b8 10 00 00 00       	mov    $0x10,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <close>:
SYSCALL(close)
 443:	b8 15 00 00 00       	mov    $0x15,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <kill>:
SYSCALL(kill)
 44b:	b8 06 00 00 00       	mov    $0x6,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <exec>:
SYSCALL(exec)
 453:	b8 07 00 00 00       	mov    $0x7,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <open>:
SYSCALL(open)
 45b:	b8 0f 00 00 00       	mov    $0xf,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <mknod>:
SYSCALL(mknod)
 463:	b8 11 00 00 00       	mov    $0x11,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <unlink>:
SYSCALL(unlink)
 46b:	b8 12 00 00 00       	mov    $0x12,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <fstat>:
SYSCALL(fstat)
 473:	b8 08 00 00 00       	mov    $0x8,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <link>:
SYSCALL(link)
 47b:	b8 13 00 00 00       	mov    $0x13,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <mkdir>:
SYSCALL(mkdir)
 483:	b8 14 00 00 00       	mov    $0x14,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <chdir>:
SYSCALL(chdir)
 48b:	b8 09 00 00 00       	mov    $0x9,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <dup>:
SYSCALL(dup)
 493:	b8 0a 00 00 00       	mov    $0xa,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <getpid>:
SYSCALL(getpid)
 49b:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <sbrk>:
SYSCALL(sbrk)
 4a3:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <sleep>:
SYSCALL(sleep)
 4ab:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <uptime>:
SYSCALL(uptime)
 4b3:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <attachpage>:
SYSCALL(attachpage)
 4bb:	b8 16 00 00 00       	mov    $0x16,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    
 4c3:	66 90                	xchg   %ax,%ax
 4c5:	66 90                	xchg   %ax,%ax
 4c7:	66 90                	xchg   %ax,%ax
 4c9:	66 90                	xchg   %ax,%ax
 4cb:	66 90                	xchg   %ax,%ax
 4cd:	66 90                	xchg   %ax,%ax
 4cf:	90                   	nop

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4d9:	85 d2                	test   %edx,%edx
{
 4db:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 4de:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 4e0:	79 76                	jns    558 <printint+0x88>
 4e2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4e6:	74 70                	je     558 <printint+0x88>
    x = -xx;
 4e8:	f7 d8                	neg    %eax
    neg = 1;
 4ea:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4f1:	31 f6                	xor    %esi,%esi
 4f3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4f6:	eb 0a                	jmp    502 <printint+0x32>
 4f8:	90                   	nop
 4f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 500:	89 fe                	mov    %edi,%esi
 502:	31 d2                	xor    %edx,%edx
 504:	8d 7e 01             	lea    0x1(%esi),%edi
 507:	f7 f1                	div    %ecx
 509:	0f b6 92 44 09 00 00 	movzbl 0x944(%edx),%edx
  }while((x /= base) != 0);
 510:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 512:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 515:	75 e9                	jne    500 <printint+0x30>
  if(neg)
 517:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 51a:	85 c0                	test   %eax,%eax
 51c:	74 08                	je     526 <printint+0x56>
    buf[i++] = '-';
 51e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 523:	8d 7e 02             	lea    0x2(%esi),%edi
 526:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 52a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
 530:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 533:	83 ec 04             	sub    $0x4,%esp
 536:	83 ee 01             	sub    $0x1,%esi
 539:	6a 01                	push   $0x1
 53b:	53                   	push   %ebx
 53c:	57                   	push   %edi
 53d:	88 45 d7             	mov    %al,-0x29(%ebp)
 540:	e8 f6 fe ff ff       	call   43b <write>

  while(--i >= 0)
 545:	83 c4 10             	add    $0x10,%esp
 548:	39 de                	cmp    %ebx,%esi
 54a:	75 e4                	jne    530 <printint+0x60>
    putc(fd, buf[i]);
}
 54c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54f:	5b                   	pop    %ebx
 550:	5e                   	pop    %esi
 551:	5f                   	pop    %edi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 558:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 55f:	eb 90                	jmp    4f1 <printint+0x21>
 561:	eb 0d                	jmp    570 <printf>
 563:	90                   	nop
 564:	90                   	nop
 565:	90                   	nop
 566:	90                   	nop
 567:	90                   	nop
 568:	90                   	nop
 569:	90                   	nop
 56a:	90                   	nop
 56b:	90                   	nop
 56c:	90                   	nop
 56d:	90                   	nop
 56e:	90                   	nop
 56f:	90                   	nop

00000570 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 579:	8b 75 0c             	mov    0xc(%ebp),%esi
 57c:	0f b6 1e             	movzbl (%esi),%ebx
 57f:	84 db                	test   %bl,%bl
 581:	0f 84 b3 00 00 00    	je     63a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 587:	8d 45 10             	lea    0x10(%ebp),%eax
 58a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 58d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 58f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 592:	eb 2f                	jmp    5c3 <printf+0x53>
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 598:	83 f8 25             	cmp    $0x25,%eax
 59b:	0f 84 a7 00 00 00    	je     648 <printf+0xd8>
  write(fd, &c, 1);
 5a1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5a4:	83 ec 04             	sub    $0x4,%esp
 5a7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5aa:	6a 01                	push   $0x1
 5ac:	50                   	push   %eax
 5ad:	ff 75 08             	pushl  0x8(%ebp)
 5b0:	e8 86 fe ff ff       	call   43b <write>
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 5bb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5bf:	84 db                	test   %bl,%bl
 5c1:	74 77                	je     63a <printf+0xca>
    if(state == 0){
 5c3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5c5:	0f be cb             	movsbl %bl,%ecx
 5c8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5cb:	74 cb                	je     598 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5cd:	83 ff 25             	cmp    $0x25,%edi
 5d0:	75 e6                	jne    5b8 <printf+0x48>
      if(c == 'd'){
 5d2:	83 f8 64             	cmp    $0x64,%eax
 5d5:	0f 84 05 01 00 00    	je     6e0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5db:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5e1:	83 f9 70             	cmp    $0x70,%ecx
 5e4:	74 72                	je     658 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5e6:	83 f8 73             	cmp    $0x73,%eax
 5e9:	0f 84 99 00 00 00    	je     688 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ef:	83 f8 63             	cmp    $0x63,%eax
 5f2:	0f 84 08 01 00 00    	je     700 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5f8:	83 f8 25             	cmp    $0x25,%eax
 5fb:	0f 84 ef 00 00 00    	je     6f0 <printf+0x180>
  write(fd, &c, 1);
 601:	8d 45 e7             	lea    -0x19(%ebp),%eax
 604:	83 ec 04             	sub    $0x4,%esp
 607:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 60b:	6a 01                	push   $0x1
 60d:	50                   	push   %eax
 60e:	ff 75 08             	pushl  0x8(%ebp)
 611:	e8 25 fe ff ff       	call   43b <write>
 616:	83 c4 0c             	add    $0xc,%esp
 619:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 61c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 61f:	6a 01                	push   $0x1
 621:	50                   	push   %eax
 622:	ff 75 08             	pushl  0x8(%ebp)
 625:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 628:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 62a:	e8 0c fe ff ff       	call   43b <write>
  for(i = 0; fmt[i]; i++){
 62f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 633:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 636:	84 db                	test   %bl,%bl
 638:	75 89                	jne    5c3 <printf+0x53>
    }
  }
}
 63a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63d:	5b                   	pop    %ebx
 63e:	5e                   	pop    %esi
 63f:	5f                   	pop    %edi
 640:	5d                   	pop    %ebp
 641:	c3                   	ret    
 642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 648:	bf 25 00 00 00       	mov    $0x25,%edi
 64d:	e9 66 ff ff ff       	jmp    5b8 <printf+0x48>
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 658:	83 ec 0c             	sub    $0xc,%esp
 65b:	b9 10 00 00 00       	mov    $0x10,%ecx
 660:	6a 00                	push   $0x0
 662:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 665:	8b 45 08             	mov    0x8(%ebp),%eax
 668:	8b 17                	mov    (%edi),%edx
 66a:	e8 61 fe ff ff       	call   4d0 <printint>
        ap++;
 66f:	89 f8                	mov    %edi,%eax
 671:	83 c4 10             	add    $0x10,%esp
      state = 0;
 674:	31 ff                	xor    %edi,%edi
        ap++;
 676:	83 c0 04             	add    $0x4,%eax
 679:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 67c:	e9 37 ff ff ff       	jmp    5b8 <printf+0x48>
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 688:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 68b:	8b 08                	mov    (%eax),%ecx
        ap++;
 68d:	83 c0 04             	add    $0x4,%eax
 690:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 693:	85 c9                	test   %ecx,%ecx
 695:	0f 84 8e 00 00 00    	je     729 <printf+0x1b9>
        while(*s != 0){
 69b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 69e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 6a0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 6a2:	84 c0                	test   %al,%al
 6a4:	0f 84 0e ff ff ff    	je     5b8 <printf+0x48>
 6aa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6ad:	89 de                	mov    %ebx,%esi
 6af:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6b2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 6b5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6b8:	83 ec 04             	sub    $0x4,%esp
          s++;
 6bb:	83 c6 01             	add    $0x1,%esi
 6be:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6c1:	6a 01                	push   $0x1
 6c3:	57                   	push   %edi
 6c4:	53                   	push   %ebx
 6c5:	e8 71 fd ff ff       	call   43b <write>
        while(*s != 0){
 6ca:	0f b6 06             	movzbl (%esi),%eax
 6cd:	83 c4 10             	add    $0x10,%esp
 6d0:	84 c0                	test   %al,%al
 6d2:	75 e4                	jne    6b8 <printf+0x148>
 6d4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 6d7:	31 ff                	xor    %edi,%edi
 6d9:	e9 da fe ff ff       	jmp    5b8 <printf+0x48>
 6de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e8:	6a 01                	push   $0x1
 6ea:	e9 73 ff ff ff       	jmp    662 <printf+0xf2>
 6ef:	90                   	nop
  write(fd, &c, 1);
 6f0:	83 ec 04             	sub    $0x4,%esp
 6f3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6f6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6f9:	6a 01                	push   $0x1
 6fb:	e9 21 ff ff ff       	jmp    621 <printf+0xb1>
        putc(fd, *ap);
 700:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 703:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 706:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 708:	6a 01                	push   $0x1
        ap++;
 70a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 70d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 710:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 713:	50                   	push   %eax
 714:	ff 75 08             	pushl  0x8(%ebp)
 717:	e8 1f fd ff ff       	call   43b <write>
        ap++;
 71c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 71f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 722:	31 ff                	xor    %edi,%edi
 724:	e9 8f fe ff ff       	jmp    5b8 <printf+0x48>
          s = "(null)";
 729:	bb 3c 09 00 00       	mov    $0x93c,%ebx
        while(*s != 0){
 72e:	b8 28 00 00 00       	mov    $0x28,%eax
 733:	e9 72 ff ff ff       	jmp    6aa <printf+0x13a>
 738:	66 90                	xchg   %ax,%ax
 73a:	66 90                	xchg   %ax,%ax
 73c:	66 90                	xchg   %ax,%ax
 73e:	66 90                	xchg   %ax,%ax

00000740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 740:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	a1 4c 0c 00 00       	mov    0xc4c,%eax
{
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 74e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 758:	39 c8                	cmp    %ecx,%eax
 75a:	8b 10                	mov    (%eax),%edx
 75c:	73 32                	jae    790 <free+0x50>
 75e:	39 d1                	cmp    %edx,%ecx
 760:	72 04                	jb     766 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 762:	39 d0                	cmp    %edx,%eax
 764:	72 32                	jb     798 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 766:	8b 73 fc             	mov    -0x4(%ebx),%esi
 769:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76c:	39 fa                	cmp    %edi,%edx
 76e:	74 30                	je     7a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 770:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 773:	8b 50 04             	mov    0x4(%eax),%edx
 776:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 779:	39 f1                	cmp    %esi,%ecx
 77b:	74 3a                	je     7b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 77d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 77f:	a3 4c 0c 00 00       	mov    %eax,0xc4c
}
 784:	5b                   	pop    %ebx
 785:	5e                   	pop    %esi
 786:	5f                   	pop    %edi
 787:	5d                   	pop    %ebp
 788:	c3                   	ret    
 789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 790:	39 d0                	cmp    %edx,%eax
 792:	72 04                	jb     798 <free+0x58>
 794:	39 d1                	cmp    %edx,%ecx
 796:	72 ce                	jb     766 <free+0x26>
{
 798:	89 d0                	mov    %edx,%eax
 79a:	eb bc                	jmp    758 <free+0x18>
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7a0:	03 72 04             	add    0x4(%edx),%esi
 7a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a6:	8b 10                	mov    (%eax),%edx
 7a8:	8b 12                	mov    (%edx),%edx
 7aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ad:	8b 50 04             	mov    0x4(%eax),%edx
 7b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7b3:	39 f1                	cmp    %esi,%ecx
 7b5:	75 c6                	jne    77d <free+0x3d>
    p->s.size += bp->s.size;
 7b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ba:	a3 4c 0c 00 00       	mov    %eax,0xc4c
    p->s.size += bp->s.size;
 7bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7c5:	89 10                	mov    %edx,(%eax)
}
 7c7:	5b                   	pop    %ebx
 7c8:	5e                   	pop    %esi
 7c9:	5f                   	pop    %edi
 7ca:	5d                   	pop    %ebp
 7cb:	c3                   	ret    
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7dc:	8b 15 4c 0c 00 00    	mov    0xc4c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e2:	8d 78 07             	lea    0x7(%eax),%edi
 7e5:	c1 ef 03             	shr    $0x3,%edi
 7e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7eb:	85 d2                	test   %edx,%edx
 7ed:	0f 84 9d 00 00 00    	je     890 <malloc+0xc0>
 7f3:	8b 02                	mov    (%edx),%eax
 7f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7f8:	39 cf                	cmp    %ecx,%edi
 7fa:	76 6c                	jbe    868 <malloc+0x98>
 7fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 802:	bb 00 10 00 00       	mov    $0x1000,%ebx
 807:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 80a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 811:	eb 0e                	jmp    821 <malloc+0x51>
 813:	90                   	nop
 814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 818:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 81a:	8b 48 04             	mov    0x4(%eax),%ecx
 81d:	39 f9                	cmp    %edi,%ecx
 81f:	73 47                	jae    868 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 821:	39 05 4c 0c 00 00    	cmp    %eax,0xc4c
 827:	89 c2                	mov    %eax,%edx
 829:	75 ed                	jne    818 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 82b:	83 ec 0c             	sub    $0xc,%esp
 82e:	56                   	push   %esi
 82f:	e8 6f fc ff ff       	call   4a3 <sbrk>
  if(p == (char*)-1)
 834:	83 c4 10             	add    $0x10,%esp
 837:	83 f8 ff             	cmp    $0xffffffff,%eax
 83a:	74 1c                	je     858 <malloc+0x88>
  hp->s.size = nu;
 83c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 83f:	83 ec 0c             	sub    $0xc,%esp
 842:	83 c0 08             	add    $0x8,%eax
 845:	50                   	push   %eax
 846:	e8 f5 fe ff ff       	call   740 <free>
  return freep;
 84b:	8b 15 4c 0c 00 00    	mov    0xc4c,%edx
      if((p = morecore(nunits)) == 0)
 851:	83 c4 10             	add    $0x10,%esp
 854:	85 d2                	test   %edx,%edx
 856:	75 c0                	jne    818 <malloc+0x48>
        return 0;
  }
}
 858:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 85b:	31 c0                	xor    %eax,%eax
}
 85d:	5b                   	pop    %ebx
 85e:	5e                   	pop    %esi
 85f:	5f                   	pop    %edi
 860:	5d                   	pop    %ebp
 861:	c3                   	ret    
 862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 868:	39 cf                	cmp    %ecx,%edi
 86a:	74 54                	je     8c0 <malloc+0xf0>
        p->s.size -= nunits;
 86c:	29 f9                	sub    %edi,%ecx
 86e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 871:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 874:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 877:	89 15 4c 0c 00 00    	mov    %edx,0xc4c
}
 87d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 880:	83 c0 08             	add    $0x8,%eax
}
 883:	5b                   	pop    %ebx
 884:	5e                   	pop    %esi
 885:	5f                   	pop    %edi
 886:	5d                   	pop    %ebp
 887:	c3                   	ret    
 888:	90                   	nop
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 890:	c7 05 4c 0c 00 00 50 	movl   $0xc50,0xc4c
 897:	0c 00 00 
 89a:	c7 05 50 0c 00 00 50 	movl   $0xc50,0xc50
 8a1:	0c 00 00 
    base.s.size = 0;
 8a4:	b8 50 0c 00 00       	mov    $0xc50,%eax
 8a9:	c7 05 54 0c 00 00 00 	movl   $0x0,0xc54
 8b0:	00 00 00 
 8b3:	e9 44 ff ff ff       	jmp    7fc <malloc+0x2c>
 8b8:	90                   	nop
 8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 8c0:	8b 08                	mov    (%eax),%ecx
 8c2:	89 0a                	mov    %ecx,(%edx)
 8c4:	eb b1                	jmp    877 <malloc+0xa7>
