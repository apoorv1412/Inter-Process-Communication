
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	be 01 00 00 00       	mov    $0x1,%esi
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  21:	83 f8 01             	cmp    $0x1,%eax
{
  24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(argc <= 1){
  27:	7e 54                	jle    7d <main+0x7d>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 3f 04 00 00       	call   47b <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	85 c0                	test   %eax,%eax
  41:	89 c7                	mov    %eax,%edi
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 07 04 00 00       	call   463 <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 d2 03 00 00       	call   43b <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 0b 09 00 00       	push   $0x90b
  71:	6a 01                	push   $0x1
  73:	e8 18 05 00 00       	call   590 <printf>
      exit();
  78:	e8 be 03 00 00       	call   43b <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 af 03 00 00       	call   43b <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 a0 0c 00 00       	push   $0xca0
  a9:	6a 01                	push   $0x1
  ab:	e8 ab 03 00 00       	call   45b <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 26                	jne    dd <cat+0x4d>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 a0 0c 00 00       	push   $0xca0
  c4:	56                   	push   %esi
  c5:	e8 89 03 00 00       	call   453 <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	83 f8 00             	cmp    $0x0,%eax
  d0:	89 c3                	mov    %eax,%ebx
  d2:	7f cc                	jg     a0 <cat+0x10>
  if(n < 0){
  d4:	75 1b                	jne    f1 <cat+0x61>
}
  d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d9:	5b                   	pop    %ebx
  da:	5e                   	pop    %esi
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
      printf(1, "cat: write error\n");
  dd:	83 ec 08             	sub    $0x8,%esp
  e0:	68 e8 08 00 00       	push   $0x8e8
  e5:	6a 01                	push   $0x1
  e7:	e8 a4 04 00 00       	call   590 <printf>
      exit();
  ec:	e8 4a 03 00 00       	call   43b <exit>
    printf(1, "cat: read error\n");
  f1:	50                   	push   %eax
  f2:	50                   	push   %eax
  f3:	68 fa 08 00 00       	push   $0x8fa
  f8:	6a 01                	push   $0x1
  fa:	e8 91 04 00 00       	call   590 <printf>
    exit();
  ff:	e8 37 03 00 00       	call   43b <exit>
 104:	66 90                	xchg   %ax,%ax
 106:	66 90                	xchg   %ax,%ax
 108:	66 90                	xchg   %ax,%ax
 10a:	66 90                	xchg   %ax,%ax
 10c:	66 90                	xchg   %ax,%ax
 10e:	66 90                	xchg   %ax,%ax

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 45 08             	mov    0x8(%ebp),%eax
 117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 11a:	89 c2                	mov    %eax,%edx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 120:	83 c1 01             	add    $0x1,%ecx
 123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 127:	83 c2 01             	add    $0x1,%edx
 12a:	84 db                	test   %bl,%bl
 12c:	88 5a ff             	mov    %bl,-0x1(%edx)
 12f:	75 ef                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 131:	5b                   	pop    %ebx
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 55 08             	mov    0x8(%ebp),%edx
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 14a:	0f b6 02             	movzbl (%edx),%eax
 14d:	0f b6 19             	movzbl (%ecx),%ebx
 150:	84 c0                	test   %al,%al
 152:	75 1c                	jne    170 <strcmp+0x30>
 154:	eb 2a                	jmp    180 <strcmp+0x40>
 156:	8d 76 00             	lea    0x0(%esi),%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 160:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 163:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 166:	83 c1 01             	add    $0x1,%ecx
 169:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 16c:	84 c0                	test   %al,%al
 16e:	74 10                	je     180 <strcmp+0x40>
 170:	38 d8                	cmp    %bl,%al
 172:	74 ec                	je     160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 174:	29 d8                	sub    %ebx,%eax
}
 176:	5b                   	pop    %ebx
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 182:	29 d8                	sub    %ebx,%eax
}
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	89 f6                	mov    %esi,%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 196:	80 39 00             	cmpb   $0x0,(%ecx)
 199:	74 15                	je     1b0 <strlen+0x20>
 19b:	31 d2                	xor    %edx,%edx
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	83 c2 01             	add    $0x1,%edx
 1a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1a7:	89 d0                	mov    %edx,%eax
 1a9:	75 f5                	jne    1a0 <strlen+0x10>
    ;
  return n;
}
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1b0:	31 c0                	xor    %eax,%eax
}
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	74 1d                	je     20e <strchr+0x2e>
    if(*s == c)
 1f1:	38 d3                	cmp    %dl,%bl
 1f3:	89 d9                	mov    %ebx,%ecx
 1f5:	75 0d                	jne    204 <strchr+0x24>
 1f7:	eb 17                	jmp    210 <strchr+0x30>
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	38 ca                	cmp    %cl,%dl
 202:	74 0c                	je     210 <strchr+0x30>
  for(; *s; s++)
 204:	83 c0 01             	add    $0x1,%eax
 207:	0f b6 10             	movzbl (%eax),%edx
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strchr+0x20>
      return (char*)s;
  return 0;
 20e:	31 c0                	xor    %eax,%eax
}
 210:	5b                   	pop    %ebx
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <gets>:

char*
gets(char *buf, int max)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
 225:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 226:	31 f6                	xor    %esi,%esi
 228:	89 f3                	mov    %esi,%ebx
{
 22a:	83 ec 1c             	sub    $0x1c,%esp
 22d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 230:	eb 2f                	jmp    261 <gets+0x41>
 232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 238:	8d 45 e7             	lea    -0x19(%ebp),%eax
 23b:	83 ec 04             	sub    $0x4,%esp
 23e:	6a 01                	push   $0x1
 240:	50                   	push   %eax
 241:	6a 00                	push   $0x0
 243:	e8 0b 02 00 00       	call   453 <read>
    if(cc < 1)
 248:	83 c4 10             	add    $0x10,%esp
 24b:	85 c0                	test   %eax,%eax
 24d:	7e 1c                	jle    26b <gets+0x4b>
      break;
    buf[i++] = c;
 24f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 253:	83 c7 01             	add    $0x1,%edi
 256:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 259:	3c 0a                	cmp    $0xa,%al
 25b:	74 23                	je     280 <gets+0x60>
 25d:	3c 0d                	cmp    $0xd,%al
 25f:	74 1f                	je     280 <gets+0x60>
  for(i=0; i+1 < max; ){
 261:	83 c3 01             	add    $0x1,%ebx
 264:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 267:	89 fe                	mov    %edi,%esi
 269:	7c cd                	jl     238 <gets+0x18>
 26b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 270:	c6 03 00             	movb   $0x0,(%ebx)
}
 273:	8d 65 f4             	lea    -0xc(%ebp),%esp
 276:	5b                   	pop    %ebx
 277:	5e                   	pop    %esi
 278:	5f                   	pop    %edi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    
 27b:	90                   	nop
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 280:	8b 75 08             	mov    0x8(%ebp),%esi
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 de                	add    %ebx,%esi
 288:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 28a:	c6 03 00             	movb   $0x0,(%ebx)
}
 28d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 290:	5b                   	pop    %ebx
 291:	5e                   	pop    %esi
 292:	5f                   	pop    %edi
 293:	5d                   	pop    %ebp
 294:	c3                   	ret    
 295:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	pushl  0x8(%ebp)
 2ad:	e8 c9 01 00 00       	call   47b <open>
  if(fd < 0)
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	pushl  0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 cc 01 00 00       	call   493 <fstat>
  close(fd);
 2c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ca:	89 c6                	mov    %eax,%esi
  close(fd);
 2cc:	e8 92 01 00 00       	call   463 <close>
  return r;
 2d1:	83 c4 10             	add    $0x10,%esp
}
 2d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e5:	eb ed                	jmp    2d4 <stat+0x34>
 2e7:	89 f6                	mov    %esi,%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 11             	movsbl (%ecx),%edx
 2fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 2fd:	3c 09                	cmp    $0x9,%al
  n = 0;
 2ff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 304:	77 1f                	ja     325 <atoi+0x35>
 306:	8d 76 00             	lea    0x0(%esi),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 310:	8d 04 80             	lea    (%eax,%eax,4),%eax
 313:	83 c1 01             	add    $0x1,%ecx
 316:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 31a:	0f be 11             	movsbl (%ecx),%edx
 31d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
  return n;
}
 325:	5b                   	pop    %ebx
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    
 328:	90                   	nop
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
 335:	8b 5d 10             	mov    0x10(%ebp),%ebx
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	85 db                	test   %ebx,%ebx
 340:	7e 14                	jle    356 <memmove+0x26>
 342:	31 d2                	xor    %edx,%edx
 344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 348:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 34c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 34f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 352:	39 d3                	cmp    %edx,%ebx
 354:	75 f2                	jne    348 <memmove+0x18>
  return vdst;
}
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000360 <writeBuffer>:

int writeBuffer(char* buff, char* va)
{
 360:	55                   	push   %ebp
  int x = 0;
 361:	31 c9                	xor    %ecx,%ecx
{
 363:	89 e5                	mov    %esp,%ebp
 365:	56                   	push   %esi
 366:	53                   	push   %ebx
 367:	8b 75 0c             	mov    0xc(%ebp),%esi
 36a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char* temp = va;
  while (*buff != '.')
 36d:	89 f0                	mov    %esi,%eax
 36f:	0f b6 13             	movzbl (%ebx),%edx
 372:	eb 09                	jmp    37d <writeBuffer+0x1d>
 374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  {
    if (*va == 'A')
 378:	80 38 41             	cmpb   $0x41,(%eax)
 37b:	74 13                	je     390 <writeBuffer+0x30>
  while (*buff != '.')
 37d:	80 fa 2e             	cmp    $0x2e,%dl
 380:	75 f6                	jne    378 <writeBuffer+0x18>
        va = temp;
      else
        va++;
    }
  }
  *va = '.';
 382:	c6 00 2e             	movb   $0x2e,(%eax)
  return 1;
}
 385:	b8 01 00 00 00       	mov    $0x1,%eax
 38a:	5b                   	pop    %ebx
 38b:	5e                   	pop    %esi
 38c:	5d                   	pop    %ebp
 38d:	c3                   	ret    
 38e:	66 90                	xchg   %ax,%ax
      x = (x + 1)%4096;
 390:	83 c1 01             	add    $0x1,%ecx
      *va = *buff;
 393:	88 10                	mov    %dl,(%eax)
      buff++;
 395:	83 c3 01             	add    $0x1,%ebx
        va++;
 398:	83 c0 01             	add    $0x1,%eax
 39b:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
 3a1:	0f 44 c6             	cmove  %esi,%eax
 3a4:	eb c9                	jmp    36f <writeBuffer+0xf>
 3a6:	8d 76 00             	lea    0x0(%esi),%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <readBuffer>:

int readBuffer(char* va)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
 3b5:	53                   	push   %ebx
  int c = 0, x = 0;
 3b6:	31 f6                	xor    %esi,%esi
 3b8:	31 db                	xor    %ebx,%ebx
{
 3ba:	83 ec 0c             	sub    $0xc,%esp
  char* temp = va;
  while (*va != '.')
 3bd:	8b 7d 08             	mov    0x8(%ebp),%edi
 3c0:	0f be 07             	movsbl (%edi),%eax
 3c3:	3c 2e                	cmp    $0x2e,%al
 3c5:	74 40                	je     407 <readBuffer+0x57>
 3c7:	89 f6                	mov    %esi,%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  {
    if (*va != 'A')
 3d0:	3c 41                	cmp    $0x41,%al
 3d2:	74 fc                	je     3d0 <readBuffer+0x20>
    {
      printf(1,"%c", *va);
 3d4:	83 ec 04             	sub    $0x4,%esp
      x = (x+1)%4096;
      c++; 
      if (x == 0)
        va = temp;
      else
        va++;
 3d7:	83 c7 01             	add    $0x1,%edi
      c++; 
 3da:	83 c3 01             	add    $0x1,%ebx
      printf(1,"%c", *va);
 3dd:	50                   	push   %eax
 3de:	68 20 09 00 00       	push   $0x920
 3e3:	6a 01                	push   $0x1
 3e5:	e8 a6 01 00 00       	call   590 <printf>
      x = (x+1)%4096;
 3ea:	8d 56 01             	lea    0x1(%esi),%edx
      *va = 'A';
 3ed:	c6 47 ff 41          	movb   $0x41,-0x1(%edi)
      if (x == 0)
 3f1:	83 c4 10             	add    $0x10,%esp
        va++;
 3f4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 3fa:	0f 44 7d 08          	cmove  0x8(%ebp),%edi
 3fe:	89 d6                	mov    %edx,%esi
  while (*va != '.')
 400:	0f be 07             	movsbl (%edi),%eax
 403:	3c 2e                	cmp    $0x2e,%al
 405:	75 c9                	jne    3d0 <readBuffer+0x20>
    }
  }
  printf(1,"\n");
 407:	83 ec 08             	sub    $0x8,%esp
 40a:	68 09 09 00 00       	push   $0x909
 40f:	6a 01                	push   $0x1
 411:	e8 7a 01 00 00       	call   590 <printf>
  printf(1,"The value of the counter is %d\n", c);
 416:	83 c4 0c             	add    $0xc,%esp
 419:	53                   	push   %ebx
 41a:	68 24 09 00 00       	push   $0x924
 41f:	6a 01                	push   $0x1
 421:	e8 6a 01 00 00       	call   590 <printf>
  return 1;
 426:	8d 65 f4             	lea    -0xc(%ebp),%esp
 429:	b8 01 00 00 00       	mov    $0x1,%eax
 42e:	5b                   	pop    %ebx
 42f:	5e                   	pop    %esi
 430:	5f                   	pop    %edi
 431:	5d                   	pop    %ebp
 432:	c3                   	ret    

00000433 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 433:	b8 01 00 00 00       	mov    $0x1,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <exit>:
SYSCALL(exit)
 43b:	b8 02 00 00 00       	mov    $0x2,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <wait>:
SYSCALL(wait)
 443:	b8 03 00 00 00       	mov    $0x3,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <pipe>:
SYSCALL(pipe)
 44b:	b8 04 00 00 00       	mov    $0x4,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <read>:
SYSCALL(read)
 453:	b8 05 00 00 00       	mov    $0x5,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <write>:
SYSCALL(write)
 45b:	b8 10 00 00 00       	mov    $0x10,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <close>:
SYSCALL(close)
 463:	b8 15 00 00 00       	mov    $0x15,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <kill>:
SYSCALL(kill)
 46b:	b8 06 00 00 00       	mov    $0x6,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <exec>:
SYSCALL(exec)
 473:	b8 07 00 00 00       	mov    $0x7,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <open>:
SYSCALL(open)
 47b:	b8 0f 00 00 00       	mov    $0xf,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <mknod>:
SYSCALL(mknod)
 483:	b8 11 00 00 00       	mov    $0x11,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <unlink>:
SYSCALL(unlink)
 48b:	b8 12 00 00 00       	mov    $0x12,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <fstat>:
SYSCALL(fstat)
 493:	b8 08 00 00 00       	mov    $0x8,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <link>:
SYSCALL(link)
 49b:	b8 13 00 00 00       	mov    $0x13,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <mkdir>:
SYSCALL(mkdir)
 4a3:	b8 14 00 00 00       	mov    $0x14,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <chdir>:
SYSCALL(chdir)
 4ab:	b8 09 00 00 00       	mov    $0x9,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <dup>:
SYSCALL(dup)
 4b3:	b8 0a 00 00 00       	mov    $0xa,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <getpid>:
SYSCALL(getpid)
 4bb:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <sbrk>:
SYSCALL(sbrk)
 4c3:	b8 0c 00 00 00       	mov    $0xc,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <sleep>:
SYSCALL(sleep)
 4cb:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <uptime>:
SYSCALL(uptime)
 4d3:	b8 0e 00 00 00       	mov    $0xe,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <attachpage>:
SYSCALL(attachpage)
 4db:	b8 16 00 00 00       	mov    $0x16,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    
 4e3:	66 90                	xchg   %ax,%ax
 4e5:	66 90                	xchg   %ax,%ax
 4e7:	66 90                	xchg   %ax,%ax
 4e9:	66 90                	xchg   %ax,%ax
 4eb:	66 90                	xchg   %ax,%ax
 4ed:	66 90                	xchg   %ax,%ax
 4ef:	90                   	nop

000004f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4f9:	85 d2                	test   %edx,%edx
{
 4fb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 4fe:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 500:	79 76                	jns    578 <printint+0x88>
 502:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 506:	74 70                	je     578 <printint+0x88>
    x = -xx;
 508:	f7 d8                	neg    %eax
    neg = 1;
 50a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 511:	31 f6                	xor    %esi,%esi
 513:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 516:	eb 0a                	jmp    522 <printint+0x32>
 518:	90                   	nop
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 520:	89 fe                	mov    %edi,%esi
 522:	31 d2                	xor    %edx,%edx
 524:	8d 7e 01             	lea    0x1(%esi),%edi
 527:	f7 f1                	div    %ecx
 529:	0f b6 92 4c 09 00 00 	movzbl 0x94c(%edx),%edx
  }while((x /= base) != 0);
 530:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 532:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 535:	75 e9                	jne    520 <printint+0x30>
  if(neg)
 537:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 53a:	85 c0                	test   %eax,%eax
 53c:	74 08                	je     546 <printint+0x56>
    buf[i++] = '-';
 53e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 543:	8d 7e 02             	lea    0x2(%esi),%edi
 546:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 54a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 54d:	8d 76 00             	lea    0x0(%esi),%esi
 550:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 553:	83 ec 04             	sub    $0x4,%esp
 556:	83 ee 01             	sub    $0x1,%esi
 559:	6a 01                	push   $0x1
 55b:	53                   	push   %ebx
 55c:	57                   	push   %edi
 55d:	88 45 d7             	mov    %al,-0x29(%ebp)
 560:	e8 f6 fe ff ff       	call   45b <write>

  while(--i >= 0)
 565:	83 c4 10             	add    $0x10,%esp
 568:	39 de                	cmp    %ebx,%esi
 56a:	75 e4                	jne    550 <printint+0x60>
    putc(fd, buf[i]);
}
 56c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56f:	5b                   	pop    %ebx
 570:	5e                   	pop    %esi
 571:	5f                   	pop    %edi
 572:	5d                   	pop    %ebp
 573:	c3                   	ret    
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 578:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 57f:	eb 90                	jmp    511 <printint+0x21>
 581:	eb 0d                	jmp    590 <printf>
 583:	90                   	nop
 584:	90                   	nop
 585:	90                   	nop
 586:	90                   	nop
 587:	90                   	nop
 588:	90                   	nop
 589:	90                   	nop
 58a:	90                   	nop
 58b:	90                   	nop
 58c:	90                   	nop
 58d:	90                   	nop
 58e:	90                   	nop
 58f:	90                   	nop

00000590 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 599:	8b 75 0c             	mov    0xc(%ebp),%esi
 59c:	0f b6 1e             	movzbl (%esi),%ebx
 59f:	84 db                	test   %bl,%bl
 5a1:	0f 84 b3 00 00 00    	je     65a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 5a7:	8d 45 10             	lea    0x10(%ebp),%eax
 5aa:	83 c6 01             	add    $0x1,%esi
  state = 0;
 5ad:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 5af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5b2:	eb 2f                	jmp    5e3 <printf+0x53>
 5b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5b8:	83 f8 25             	cmp    $0x25,%eax
 5bb:	0f 84 a7 00 00 00    	je     668 <printf+0xd8>
  write(fd, &c, 1);
 5c1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5c4:	83 ec 04             	sub    $0x4,%esp
 5c7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5ca:	6a 01                	push   $0x1
 5cc:	50                   	push   %eax
 5cd:	ff 75 08             	pushl  0x8(%ebp)
 5d0:	e8 86 fe ff ff       	call   45b <write>
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 5db:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5df:	84 db                	test   %bl,%bl
 5e1:	74 77                	je     65a <printf+0xca>
    if(state == 0){
 5e3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5e5:	0f be cb             	movsbl %bl,%ecx
 5e8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5eb:	74 cb                	je     5b8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5ed:	83 ff 25             	cmp    $0x25,%edi
 5f0:	75 e6                	jne    5d8 <printf+0x48>
      if(c == 'd'){
 5f2:	83 f8 64             	cmp    $0x64,%eax
 5f5:	0f 84 05 01 00 00    	je     700 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5fb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 601:	83 f9 70             	cmp    $0x70,%ecx
 604:	74 72                	je     678 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 606:	83 f8 73             	cmp    $0x73,%eax
 609:	0f 84 99 00 00 00    	je     6a8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 60f:	83 f8 63             	cmp    $0x63,%eax
 612:	0f 84 08 01 00 00    	je     720 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 618:	83 f8 25             	cmp    $0x25,%eax
 61b:	0f 84 ef 00 00 00    	je     710 <printf+0x180>
  write(fd, &c, 1);
 621:	8d 45 e7             	lea    -0x19(%ebp),%eax
 624:	83 ec 04             	sub    $0x4,%esp
 627:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 62b:	6a 01                	push   $0x1
 62d:	50                   	push   %eax
 62e:	ff 75 08             	pushl  0x8(%ebp)
 631:	e8 25 fe ff ff       	call   45b <write>
 636:	83 c4 0c             	add    $0xc,%esp
 639:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 63c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 63f:	6a 01                	push   $0x1
 641:	50                   	push   %eax
 642:	ff 75 08             	pushl  0x8(%ebp)
 645:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 648:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 64a:	e8 0c fe ff ff       	call   45b <write>
  for(i = 0; fmt[i]; i++){
 64f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 653:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 656:	84 db                	test   %bl,%bl
 658:	75 89                	jne    5e3 <printf+0x53>
    }
  }
}
 65a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 65d:	5b                   	pop    %ebx
 65e:	5e                   	pop    %esi
 65f:	5f                   	pop    %edi
 660:	5d                   	pop    %ebp
 661:	c3                   	ret    
 662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 668:	bf 25 00 00 00       	mov    $0x25,%edi
 66d:	e9 66 ff ff ff       	jmp    5d8 <printf+0x48>
 672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 678:	83 ec 0c             	sub    $0xc,%esp
 67b:	b9 10 00 00 00       	mov    $0x10,%ecx
 680:	6a 00                	push   $0x0
 682:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	8b 17                	mov    (%edi),%edx
 68a:	e8 61 fe ff ff       	call   4f0 <printint>
        ap++;
 68f:	89 f8                	mov    %edi,%eax
 691:	83 c4 10             	add    $0x10,%esp
      state = 0;
 694:	31 ff                	xor    %edi,%edi
        ap++;
 696:	83 c0 04             	add    $0x4,%eax
 699:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 69c:	e9 37 ff ff ff       	jmp    5d8 <printf+0x48>
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6ab:	8b 08                	mov    (%eax),%ecx
        ap++;
 6ad:	83 c0 04             	add    $0x4,%eax
 6b0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 6b3:	85 c9                	test   %ecx,%ecx
 6b5:	0f 84 8e 00 00 00    	je     749 <printf+0x1b9>
        while(*s != 0){
 6bb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 6be:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 6c0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 6c2:	84 c0                	test   %al,%al
 6c4:	0f 84 0e ff ff ff    	je     5d8 <printf+0x48>
 6ca:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6cd:	89 de                	mov    %ebx,%esi
 6cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6d2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 6d5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6d8:	83 ec 04             	sub    $0x4,%esp
          s++;
 6db:	83 c6 01             	add    $0x1,%esi
 6de:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6e1:	6a 01                	push   $0x1
 6e3:	57                   	push   %edi
 6e4:	53                   	push   %ebx
 6e5:	e8 71 fd ff ff       	call   45b <write>
        while(*s != 0){
 6ea:	0f b6 06             	movzbl (%esi),%eax
 6ed:	83 c4 10             	add    $0x10,%esp
 6f0:	84 c0                	test   %al,%al
 6f2:	75 e4                	jne    6d8 <printf+0x148>
 6f4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 6f7:	31 ff                	xor    %edi,%edi
 6f9:	e9 da fe ff ff       	jmp    5d8 <printf+0x48>
 6fe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 0a 00 00 00       	mov    $0xa,%ecx
 708:	6a 01                	push   $0x1
 70a:	e9 73 ff ff ff       	jmp    682 <printf+0xf2>
 70f:	90                   	nop
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
 713:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 716:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 719:	6a 01                	push   $0x1
 71b:	e9 21 ff ff ff       	jmp    641 <printf+0xb1>
        putc(fd, *ap);
 720:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 723:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 726:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 728:	6a 01                	push   $0x1
        ap++;
 72a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 72d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 730:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 733:	50                   	push   %eax
 734:	ff 75 08             	pushl  0x8(%ebp)
 737:	e8 1f fd ff ff       	call   45b <write>
        ap++;
 73c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 73f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 742:	31 ff                	xor    %edi,%edi
 744:	e9 8f fe ff ff       	jmp    5d8 <printf+0x48>
          s = "(null)";
 749:	bb 44 09 00 00       	mov    $0x944,%ebx
        while(*s != 0){
 74e:	b8 28 00 00 00       	mov    $0x28,%eax
 753:	e9 72 ff ff ff       	jmp    6ca <printf+0x13a>
 758:	66 90                	xchg   %ax,%ax
 75a:	66 90                	xchg   %ax,%ax
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 80 0c 00 00       	mov    0xc80,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 778:	39 c8                	cmp    %ecx,%eax
 77a:	8b 10                	mov    (%eax),%edx
 77c:	73 32                	jae    7b0 <free+0x50>
 77e:	39 d1                	cmp    %edx,%ecx
 780:	72 04                	jb     786 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 782:	39 d0                	cmp    %edx,%eax
 784:	72 32                	jb     7b8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 786:	8b 73 fc             	mov    -0x4(%ebx),%esi
 789:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78c:	39 fa                	cmp    %edi,%edx
 78e:	74 30                	je     7c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 790:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 793:	8b 50 04             	mov    0x4(%eax),%edx
 796:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 799:	39 f1                	cmp    %esi,%ecx
 79b:	74 3a                	je     7d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 79d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 79f:	a3 80 0c 00 00       	mov    %eax,0xc80
}
 7a4:	5b                   	pop    %ebx
 7a5:	5e                   	pop    %esi
 7a6:	5f                   	pop    %edi
 7a7:	5d                   	pop    %ebp
 7a8:	c3                   	ret    
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	39 d0                	cmp    %edx,%eax
 7b2:	72 04                	jb     7b8 <free+0x58>
 7b4:	39 d1                	cmp    %edx,%ecx
 7b6:	72 ce                	jb     786 <free+0x26>
{
 7b8:	89 d0                	mov    %edx,%eax
 7ba:	eb bc                	jmp    778 <free+0x18>
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7c0:	03 72 04             	add    0x4(%edx),%esi
 7c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	8b 12                	mov    (%edx),%edx
 7ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cd:	8b 50 04             	mov    0x4(%eax),%edx
 7d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d3:	39 f1                	cmp    %esi,%ecx
 7d5:	75 c6                	jne    79d <free+0x3d>
    p->s.size += bp->s.size;
 7d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7da:	a3 80 0c 00 00       	mov    %eax,0xc80
    p->s.size += bp->s.size;
 7df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7e5:	89 10                	mov    %edx,(%eax)
}
 7e7:	5b                   	pop    %ebx
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 15 80 0c 00 00    	mov    0xc80,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 78 07             	lea    0x7(%eax),%edi
 805:	c1 ef 03             	shr    $0x3,%edi
 808:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 80b:	85 d2                	test   %edx,%edx
 80d:	0f 84 9d 00 00 00    	je     8b0 <malloc+0xc0>
 813:	8b 02                	mov    (%edx),%eax
 815:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 818:	39 cf                	cmp    %ecx,%edi
 81a:	76 6c                	jbe    888 <malloc+0x98>
 81c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 822:	bb 00 10 00 00       	mov    $0x1000,%ebx
 827:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 82a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 831:	eb 0e                	jmp    841 <malloc+0x51>
 833:	90                   	nop
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 838:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 83a:	8b 48 04             	mov    0x4(%eax),%ecx
 83d:	39 f9                	cmp    %edi,%ecx
 83f:	73 47                	jae    888 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 841:	39 05 80 0c 00 00    	cmp    %eax,0xc80
 847:	89 c2                	mov    %eax,%edx
 849:	75 ed                	jne    838 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 84b:	83 ec 0c             	sub    $0xc,%esp
 84e:	56                   	push   %esi
 84f:	e8 6f fc ff ff       	call   4c3 <sbrk>
  if(p == (char*)-1)
 854:	83 c4 10             	add    $0x10,%esp
 857:	83 f8 ff             	cmp    $0xffffffff,%eax
 85a:	74 1c                	je     878 <malloc+0x88>
  hp->s.size = nu;
 85c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 85f:	83 ec 0c             	sub    $0xc,%esp
 862:	83 c0 08             	add    $0x8,%eax
 865:	50                   	push   %eax
 866:	e8 f5 fe ff ff       	call   760 <free>
  return freep;
 86b:	8b 15 80 0c 00 00    	mov    0xc80,%edx
      if((p = morecore(nunits)) == 0)
 871:	83 c4 10             	add    $0x10,%esp
 874:	85 d2                	test   %edx,%edx
 876:	75 c0                	jne    838 <malloc+0x48>
        return 0;
  }
}
 878:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 87b:	31 c0                	xor    %eax,%eax
}
 87d:	5b                   	pop    %ebx
 87e:	5e                   	pop    %esi
 87f:	5f                   	pop    %edi
 880:	5d                   	pop    %ebp
 881:	c3                   	ret    
 882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 888:	39 cf                	cmp    %ecx,%edi
 88a:	74 54                	je     8e0 <malloc+0xf0>
        p->s.size -= nunits;
 88c:	29 f9                	sub    %edi,%ecx
 88e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 891:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 894:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 897:	89 15 80 0c 00 00    	mov    %edx,0xc80
}
 89d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8a0:	83 c0 08             	add    $0x8,%eax
}
 8a3:	5b                   	pop    %ebx
 8a4:	5e                   	pop    %esi
 8a5:	5f                   	pop    %edi
 8a6:	5d                   	pop    %ebp
 8a7:	c3                   	ret    
 8a8:	90                   	nop
 8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 80 0c 00 00 84 	movl   $0xc84,0xc80
 8b7:	0c 00 00 
 8ba:	c7 05 84 0c 00 00 84 	movl   $0xc84,0xc84
 8c1:	0c 00 00 
    base.s.size = 0;
 8c4:	b8 84 0c 00 00       	mov    $0xc84,%eax
 8c9:	c7 05 88 0c 00 00 00 	movl   $0x0,0xc88
 8d0:	00 00 00 
 8d3:	e9 44 ff ff ff       	jmp    81c <malloc+0x2c>
 8d8:	90                   	nop
 8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 08                	mov    (%eax),%ecx
 8e2:	89 0a                	mov    %ecx,(%edx)
 8e4:	eb b1                	jmp    897 <malloc+0xa7>
