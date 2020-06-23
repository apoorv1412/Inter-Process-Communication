
_mkdir:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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
  11:	bf 01 00 00 00       	mov    $0x1,%edi
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  21:	83 fe 01             	cmp    $0x1,%esi
  24:	7e 3e                	jle    64 <main+0x64>
  26:	8d 76 00             	lea    0x0(%esi),%esi
  29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	e8 d9 03 00 00       	call   413 <mkdir>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 0f                	js     50 <main+0x50>
  for(i = 1; i < argc; i++){
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  4b:	e8 5b 03 00 00       	call   3ab <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  50:	50                   	push   %eax
  51:	ff 33                	pushl  (%ebx)
  53:	68 6f 08 00 00       	push   $0x86f
  58:	6a 02                	push   $0x2
  5a:	e8 a1 04 00 00       	call   500 <printf>
      break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
    printf(2, "Usage: mkdir files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 58 08 00 00       	push   $0x858
  6b:	6a 02                	push   $0x2
  6d:	e8 8e 04 00 00       	call   500 <printf>
    exit();
  72:	e8 34 03 00 00       	call   3ab <exit>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	53                   	push   %ebx
  84:	8b 45 08             	mov    0x8(%ebp),%eax
  87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  8a:	89 c2                	mov    %eax,%edx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	83 c1 01             	add    $0x1,%ecx
  93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 db                	test   %bl,%bl
  9c:	88 5a ff             	mov    %bl,-0x1(%edx)
  9f:	75 ef                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  a1:	5b                   	pop    %ebx
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    
  a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	0f b6 19             	movzbl (%ecx),%ebx
  c0:	84 c0                	test   %al,%al
  c2:	75 1c                	jne    e0 <strcmp+0x30>
  c4:	eb 2a                	jmp    f0 <strcmp+0x40>
  c6:	8d 76 00             	lea    0x0(%esi),%esi
  c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  d0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  d6:	83 c1 01             	add    $0x1,%ecx
  d9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
  dc:	84 c0                	test   %al,%al
  de:	74 10                	je     f0 <strcmp+0x40>
  e0:	38 d8                	cmp    %bl,%al
  e2:	74 ec                	je     d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  e4:	29 d8                	sub    %ebx,%eax
}
  e6:	5b                   	pop    %ebx
  e7:	5d                   	pop    %ebp
  e8:	c3                   	ret    
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  f2:	29 d8                	sub    %ebx,%eax
}
  f4:	5b                   	pop    %ebx
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	89 f6                	mov    %esi,%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 39 00             	cmpb   $0x0,(%ecx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 d2                	xor    %edx,%edx
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c2 01             	add    $0x1,%edx
 113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 117:	89 d0                	mov    %edx,%eax
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
 11d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 120:	31 c0                	xor    %eax,%eax
}
 122:	5d                   	pop    %ebp
 123:	c3                   	ret    
 124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 12a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	89 d0                	mov    %edx,%eax
 144:	5f                   	pop    %edi
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	74 1d                	je     17e <strchr+0x2e>
    if(*s == c)
 161:	38 d3                	cmp    %dl,%bl
 163:	89 d9                	mov    %ebx,%ecx
 165:	75 0d                	jne    174 <strchr+0x24>
 167:	eb 17                	jmp    180 <strchr+0x30>
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 170:	38 ca                	cmp    %cl,%dl
 172:	74 0c                	je     180 <strchr+0x30>
  for(; *s; s++)
 174:	83 c0 01             	add    $0x1,%eax
 177:	0f b6 10             	movzbl (%eax),%edx
 17a:	84 d2                	test   %dl,%dl
 17c:	75 f2                	jne    170 <strchr+0x20>
      return (char*)s;
  return 0;
 17e:	31 c0                	xor    %eax,%eax
}
 180:	5b                   	pop    %ebx
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
 195:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 196:	31 f6                	xor    %esi,%esi
 198:	89 f3                	mov    %esi,%ebx
{
 19a:	83 ec 1c             	sub    $0x1c,%esp
 19d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1a0:	eb 2f                	jmp    1d1 <gets+0x41>
 1a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1ab:	83 ec 04             	sub    $0x4,%esp
 1ae:	6a 01                	push   $0x1
 1b0:	50                   	push   %eax
 1b1:	6a 00                	push   $0x0
 1b3:	e8 0b 02 00 00       	call   3c3 <read>
    if(cc < 1)
 1b8:	83 c4 10             	add    $0x10,%esp
 1bb:	85 c0                	test   %eax,%eax
 1bd:	7e 1c                	jle    1db <gets+0x4b>
      break;
    buf[i++] = c;
 1bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c3:	83 c7 01             	add    $0x1,%edi
 1c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1c9:	3c 0a                	cmp    $0xa,%al
 1cb:	74 23                	je     1f0 <gets+0x60>
 1cd:	3c 0d                	cmp    $0xd,%al
 1cf:	74 1f                	je     1f0 <gets+0x60>
  for(i=0; i+1 < max; ){
 1d1:	83 c3 01             	add    $0x1,%ebx
 1d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d7:	89 fe                	mov    %edi,%esi
 1d9:	7c cd                	jl     1a8 <gets+0x18>
 1db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1e0:	c6 03 00             	movb   $0x0,(%ebx)
}
 1e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e6:	5b                   	pop    %ebx
 1e7:	5e                   	pop    %esi
 1e8:	5f                   	pop    %edi
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    
 1eb:	90                   	nop
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f0:	8b 75 08             	mov    0x8(%ebp),%esi
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	01 de                	add    %ebx,%esi
 1f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1fa:	c6 03 00             	movb   $0x0,(%ebx)
}
 1fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 200:	5b                   	pop    %ebx
 201:	5e                   	pop    %esi
 202:	5f                   	pop    %edi
 203:	5d                   	pop    %ebp
 204:	c3                   	ret    
 205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 215:	83 ec 08             	sub    $0x8,%esp
 218:	6a 00                	push   $0x0
 21a:	ff 75 08             	pushl  0x8(%ebp)
 21d:	e8 c9 01 00 00       	call   3eb <open>
  if(fd < 0)
 222:	83 c4 10             	add    $0x10,%esp
 225:	85 c0                	test   %eax,%eax
 227:	78 27                	js     250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	ff 75 0c             	pushl  0xc(%ebp)
 22f:	89 c3                	mov    %eax,%ebx
 231:	50                   	push   %eax
 232:	e8 cc 01 00 00       	call   403 <fstat>
  close(fd);
 237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	e8 92 01 00 00       	call   3d3 <close>
  return r;
 241:	83 c4 10             	add    $0x10,%esp
}
 244:	8d 65 f8             	lea    -0x8(%ebp),%esp
 247:	89 f0                	mov    %esi,%eax
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb ed                	jmp    244 <stat+0x34>
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 267:	0f be 11             	movsbl (%ecx),%edx
 26a:	8d 42 d0             	lea    -0x30(%edx),%eax
 26d:	3c 09                	cmp    $0x9,%al
  n = 0;
 26f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 274:	77 1f                	ja     295 <atoi+0x35>
 276:	8d 76 00             	lea    0x0(%esi),%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 280:	8d 04 80             	lea    (%eax,%eax,4),%eax
 283:	83 c1 01             	add    $0x1,%ecx
 286:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 28a:	0f be 11             	movsbl (%ecx),%edx
 28d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	5b                   	pop    %ebx
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    
 298:	90                   	nop
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
 2a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ae:	85 db                	test   %ebx,%ebx
 2b0:	7e 14                	jle    2c6 <memmove+0x26>
 2b2:	31 d2                	xor    %edx,%edx
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 2c2:	39 d3                	cmp    %edx,%ebx
 2c4:	75 f2                	jne    2b8 <memmove+0x18>
  return vdst;
}
 2c6:	5b                   	pop    %ebx
 2c7:	5e                   	pop    %esi
 2c8:	5d                   	pop    %ebp
 2c9:	c3                   	ret    
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002d0 <writeBuffer>:

int writeBuffer(char* buff, char* va)
{
 2d0:	55                   	push   %ebp
  int x = 0;
 2d1:	31 c9                	xor    %ecx,%ecx
{
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	56                   	push   %esi
 2d6:	53                   	push   %ebx
 2d7:	8b 75 0c             	mov    0xc(%ebp),%esi
 2da:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char* temp = va;
  while (*buff != '.')
 2dd:	89 f0                	mov    %esi,%eax
 2df:	0f b6 13             	movzbl (%ebx),%edx
 2e2:	eb 09                	jmp    2ed <writeBuffer+0x1d>
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  {
    if (*va == 'A')
 2e8:	80 38 41             	cmpb   $0x41,(%eax)
 2eb:	74 13                	je     300 <writeBuffer+0x30>
  while (*buff != '.')
 2ed:	80 fa 2e             	cmp    $0x2e,%dl
 2f0:	75 f6                	jne    2e8 <writeBuffer+0x18>
        va = temp;
      else
        va++;
    }
  }
  *va = '.';
 2f2:	c6 00 2e             	movb   $0x2e,(%eax)
  return 1;
}
 2f5:	b8 01 00 00 00       	mov    $0x1,%eax
 2fa:	5b                   	pop    %ebx
 2fb:	5e                   	pop    %esi
 2fc:	5d                   	pop    %ebp
 2fd:	c3                   	ret    
 2fe:	66 90                	xchg   %ax,%ax
      x = (x + 1)%4096;
 300:	83 c1 01             	add    $0x1,%ecx
      *va = *buff;
 303:	88 10                	mov    %dl,(%eax)
      buff++;
 305:	83 c3 01             	add    $0x1,%ebx
        va++;
 308:	83 c0 01             	add    $0x1,%eax
 30b:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
 311:	0f 44 c6             	cmove  %esi,%eax
 314:	eb c9                	jmp    2df <writeBuffer+0xf>
 316:	8d 76 00             	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <readBuffer>:

int readBuffer(char* va)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
  int c = 0, x = 0;
 326:	31 f6                	xor    %esi,%esi
 328:	31 db                	xor    %ebx,%ebx
{
 32a:	83 ec 0c             	sub    $0xc,%esp
  char* temp = va;
  while (*va != '.')
 32d:	8b 7d 08             	mov    0x8(%ebp),%edi
 330:	0f be 07             	movsbl (%edi),%eax
 333:	3c 2e                	cmp    $0x2e,%al
 335:	74 40                	je     377 <readBuffer+0x57>
 337:	89 f6                	mov    %esi,%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  {
    if (*va != 'A')
 340:	3c 41                	cmp    $0x41,%al
 342:	74 fc                	je     340 <readBuffer+0x20>
    {
      printf(1,"%c", *va);
 344:	83 ec 04             	sub    $0x4,%esp
      x = (x+1)%4096;
      c++; 
      if (x == 0)
        va = temp;
      else
        va++;
 347:	83 c7 01             	add    $0x1,%edi
      c++; 
 34a:	83 c3 01             	add    $0x1,%ebx
      printf(1,"%c", *va);
 34d:	50                   	push   %eax
 34e:	68 8b 08 00 00       	push   $0x88b
 353:	6a 01                	push   $0x1
 355:	e8 a6 01 00 00       	call   500 <printf>
      x = (x+1)%4096;
 35a:	8d 56 01             	lea    0x1(%esi),%edx
      *va = 'A';
 35d:	c6 47 ff 41          	movb   $0x41,-0x1(%edi)
      if (x == 0)
 361:	83 c4 10             	add    $0x10,%esp
        va++;
 364:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 36a:	0f 44 7d 08          	cmove  0x8(%ebp),%edi
 36e:	89 d6                	mov    %edx,%esi
  while (*va != '.')
 370:	0f be 07             	movsbl (%edi),%eax
 373:	3c 2e                	cmp    $0x2e,%al
 375:	75 c9                	jne    340 <readBuffer+0x20>
    }
  }
  printf(1,"\n");
 377:	83 ec 08             	sub    $0x8,%esp
 37a:	68 6d 08 00 00       	push   $0x86d
 37f:	6a 01                	push   $0x1
 381:	e8 7a 01 00 00       	call   500 <printf>
  printf(1,"The value of the counter is %d\n", c);
 386:	83 c4 0c             	add    $0xc,%esp
 389:	53                   	push   %ebx
 38a:	68 90 08 00 00       	push   $0x890
 38f:	6a 01                	push   $0x1
 391:	e8 6a 01 00 00       	call   500 <printf>
  return 1;
 396:	8d 65 f4             	lea    -0xc(%ebp),%esp
 399:	b8 01 00 00 00       	mov    $0x1,%eax
 39e:	5b                   	pop    %ebx
 39f:	5e                   	pop    %esi
 3a0:	5f                   	pop    %edi
 3a1:	5d                   	pop    %ebp
 3a2:	c3                   	ret    

000003a3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3a3:	b8 01 00 00 00       	mov    $0x1,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <exit>:
SYSCALL(exit)
 3ab:	b8 02 00 00 00       	mov    $0x2,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <wait>:
SYSCALL(wait)
 3b3:	b8 03 00 00 00       	mov    $0x3,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <pipe>:
SYSCALL(pipe)
 3bb:	b8 04 00 00 00       	mov    $0x4,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <read>:
SYSCALL(read)
 3c3:	b8 05 00 00 00       	mov    $0x5,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <write>:
SYSCALL(write)
 3cb:	b8 10 00 00 00       	mov    $0x10,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <close>:
SYSCALL(close)
 3d3:	b8 15 00 00 00       	mov    $0x15,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <kill>:
SYSCALL(kill)
 3db:	b8 06 00 00 00       	mov    $0x6,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <exec>:
SYSCALL(exec)
 3e3:	b8 07 00 00 00       	mov    $0x7,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <open>:
SYSCALL(open)
 3eb:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <mknod>:
SYSCALL(mknod)
 3f3:	b8 11 00 00 00       	mov    $0x11,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <unlink>:
SYSCALL(unlink)
 3fb:	b8 12 00 00 00       	mov    $0x12,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <fstat>:
SYSCALL(fstat)
 403:	b8 08 00 00 00       	mov    $0x8,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <link>:
SYSCALL(link)
 40b:	b8 13 00 00 00       	mov    $0x13,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <mkdir>:
SYSCALL(mkdir)
 413:	b8 14 00 00 00       	mov    $0x14,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <chdir>:
SYSCALL(chdir)
 41b:	b8 09 00 00 00       	mov    $0x9,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <dup>:
SYSCALL(dup)
 423:	b8 0a 00 00 00       	mov    $0xa,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <getpid>:
SYSCALL(getpid)
 42b:	b8 0b 00 00 00       	mov    $0xb,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <sbrk>:
SYSCALL(sbrk)
 433:	b8 0c 00 00 00       	mov    $0xc,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <sleep>:
SYSCALL(sleep)
 43b:	b8 0d 00 00 00       	mov    $0xd,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <uptime>:
SYSCALL(uptime)
 443:	b8 0e 00 00 00       	mov    $0xe,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <attachpage>:
SYSCALL(attachpage)
 44b:	b8 16 00 00 00       	mov    $0x16,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    
 453:	66 90                	xchg   %ax,%ax
 455:	66 90                	xchg   %ax,%ax
 457:	66 90                	xchg   %ax,%ax
 459:	66 90                	xchg   %ax,%ax
 45b:	66 90                	xchg   %ax,%ax
 45d:	66 90                	xchg   %ax,%ax
 45f:	90                   	nop

00000460 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 469:	85 d2                	test   %edx,%edx
{
 46b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 46e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 470:	79 76                	jns    4e8 <printint+0x88>
 472:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 476:	74 70                	je     4e8 <printint+0x88>
    x = -xx;
 478:	f7 d8                	neg    %eax
    neg = 1;
 47a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 481:	31 f6                	xor    %esi,%esi
 483:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 486:	eb 0a                	jmp    492 <printint+0x32>
 488:	90                   	nop
 489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 490:	89 fe                	mov    %edi,%esi
 492:	31 d2                	xor    %edx,%edx
 494:	8d 7e 01             	lea    0x1(%esi),%edi
 497:	f7 f1                	div    %ecx
 499:	0f b6 92 b8 08 00 00 	movzbl 0x8b8(%edx),%edx
  }while((x /= base) != 0);
 4a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 4a2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 4a5:	75 e9                	jne    490 <printint+0x30>
  if(neg)
 4a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4aa:	85 c0                	test   %eax,%eax
 4ac:	74 08                	je     4b6 <printint+0x56>
    buf[i++] = '-';
 4ae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 4b3:	8d 7e 02             	lea    0x2(%esi),%edi
 4b6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 4ba:	8b 7d c0             	mov    -0x40(%ebp),%edi
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
 4c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 4c3:	83 ec 04             	sub    $0x4,%esp
 4c6:	83 ee 01             	sub    $0x1,%esi
 4c9:	6a 01                	push   $0x1
 4cb:	53                   	push   %ebx
 4cc:	57                   	push   %edi
 4cd:	88 45 d7             	mov    %al,-0x29(%ebp)
 4d0:	e8 f6 fe ff ff       	call   3cb <write>

  while(--i >= 0)
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	39 de                	cmp    %ebx,%esi
 4da:	75 e4                	jne    4c0 <printint+0x60>
    putc(fd, buf[i]);
}
 4dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4df:	5b                   	pop    %ebx
 4e0:	5e                   	pop    %esi
 4e1:	5f                   	pop    %edi
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4e8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4ef:	eb 90                	jmp    481 <printint+0x21>
 4f1:	eb 0d                	jmp    500 <printf>
 4f3:	90                   	nop
 4f4:	90                   	nop
 4f5:	90                   	nop
 4f6:	90                   	nop
 4f7:	90                   	nop
 4f8:	90                   	nop
 4f9:	90                   	nop
 4fa:	90                   	nop
 4fb:	90                   	nop
 4fc:	90                   	nop
 4fd:	90                   	nop
 4fe:	90                   	nop
 4ff:	90                   	nop

00000500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 509:	8b 75 0c             	mov    0xc(%ebp),%esi
 50c:	0f b6 1e             	movzbl (%esi),%ebx
 50f:	84 db                	test   %bl,%bl
 511:	0f 84 b3 00 00 00    	je     5ca <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 517:	8d 45 10             	lea    0x10(%ebp),%eax
 51a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 51d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 51f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 522:	eb 2f                	jmp    553 <printf+0x53>
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 528:	83 f8 25             	cmp    $0x25,%eax
 52b:	0f 84 a7 00 00 00    	je     5d8 <printf+0xd8>
  write(fd, &c, 1);
 531:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 534:	83 ec 04             	sub    $0x4,%esp
 537:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 53a:	6a 01                	push   $0x1
 53c:	50                   	push   %eax
 53d:	ff 75 08             	pushl  0x8(%ebp)
 540:	e8 86 fe ff ff       	call   3cb <write>
 545:	83 c4 10             	add    $0x10,%esp
 548:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 54b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 54f:	84 db                	test   %bl,%bl
 551:	74 77                	je     5ca <printf+0xca>
    if(state == 0){
 553:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 555:	0f be cb             	movsbl %bl,%ecx
 558:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 55b:	74 cb                	je     528 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 55d:	83 ff 25             	cmp    $0x25,%edi
 560:	75 e6                	jne    548 <printf+0x48>
      if(c == 'd'){
 562:	83 f8 64             	cmp    $0x64,%eax
 565:	0f 84 05 01 00 00    	je     670 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 56b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 571:	83 f9 70             	cmp    $0x70,%ecx
 574:	74 72                	je     5e8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 576:	83 f8 73             	cmp    $0x73,%eax
 579:	0f 84 99 00 00 00    	je     618 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 57f:	83 f8 63             	cmp    $0x63,%eax
 582:	0f 84 08 01 00 00    	je     690 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 588:	83 f8 25             	cmp    $0x25,%eax
 58b:	0f 84 ef 00 00 00    	je     680 <printf+0x180>
  write(fd, &c, 1);
 591:	8d 45 e7             	lea    -0x19(%ebp),%eax
 594:	83 ec 04             	sub    $0x4,%esp
 597:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 59b:	6a 01                	push   $0x1
 59d:	50                   	push   %eax
 59e:	ff 75 08             	pushl  0x8(%ebp)
 5a1:	e8 25 fe ff ff       	call   3cb <write>
 5a6:	83 c4 0c             	add    $0xc,%esp
 5a9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5ac:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 5af:	6a 01                	push   $0x1
 5b1:	50                   	push   %eax
 5b2:	ff 75 08             	pushl  0x8(%ebp)
 5b5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5b8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5ba:	e8 0c fe ff ff       	call   3cb <write>
  for(i = 0; fmt[i]; i++){
 5bf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 5c3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5c6:	84 db                	test   %bl,%bl
 5c8:	75 89                	jne    553 <printf+0x53>
    }
  }
}
 5ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cd:	5b                   	pop    %ebx
 5ce:	5e                   	pop    %esi
 5cf:	5f                   	pop    %edi
 5d0:	5d                   	pop    %ebp
 5d1:	c3                   	ret    
 5d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 5d8:	bf 25 00 00 00       	mov    $0x25,%edi
 5dd:	e9 66 ff ff ff       	jmp    548 <printf+0x48>
 5e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5e8:	83 ec 0c             	sub    $0xc,%esp
 5eb:	b9 10 00 00 00       	mov    $0x10,%ecx
 5f0:	6a 00                	push   $0x0
 5f2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 5f5:	8b 45 08             	mov    0x8(%ebp),%eax
 5f8:	8b 17                	mov    (%edi),%edx
 5fa:	e8 61 fe ff ff       	call   460 <printint>
        ap++;
 5ff:	89 f8                	mov    %edi,%eax
 601:	83 c4 10             	add    $0x10,%esp
      state = 0;
 604:	31 ff                	xor    %edi,%edi
        ap++;
 606:	83 c0 04             	add    $0x4,%eax
 609:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 60c:	e9 37 ff ff ff       	jmp    548 <printf+0x48>
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 618:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 61b:	8b 08                	mov    (%eax),%ecx
        ap++;
 61d:	83 c0 04             	add    $0x4,%eax
 620:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 623:	85 c9                	test   %ecx,%ecx
 625:	0f 84 8e 00 00 00    	je     6b9 <printf+0x1b9>
        while(*s != 0){
 62b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 62e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 630:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 632:	84 c0                	test   %al,%al
 634:	0f 84 0e ff ff ff    	je     548 <printf+0x48>
 63a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 63d:	89 de                	mov    %ebx,%esi
 63f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 642:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 645:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 648:	83 ec 04             	sub    $0x4,%esp
          s++;
 64b:	83 c6 01             	add    $0x1,%esi
 64e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 651:	6a 01                	push   $0x1
 653:	57                   	push   %edi
 654:	53                   	push   %ebx
 655:	e8 71 fd ff ff       	call   3cb <write>
        while(*s != 0){
 65a:	0f b6 06             	movzbl (%esi),%eax
 65d:	83 c4 10             	add    $0x10,%esp
 660:	84 c0                	test   %al,%al
 662:	75 e4                	jne    648 <printf+0x148>
 664:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 667:	31 ff                	xor    %edi,%edi
 669:	e9 da fe ff ff       	jmp    548 <printf+0x48>
 66e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	b9 0a 00 00 00       	mov    $0xa,%ecx
 678:	6a 01                	push   $0x1
 67a:	e9 73 ff ff ff       	jmp    5f2 <printf+0xf2>
 67f:	90                   	nop
  write(fd, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
 683:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 686:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 689:	6a 01                	push   $0x1
 68b:	e9 21 ff ff ff       	jmp    5b1 <printf+0xb1>
        putc(fd, *ap);
 690:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 693:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 696:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 698:	6a 01                	push   $0x1
        ap++;
 69a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 69d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6a0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6a3:	50                   	push   %eax
 6a4:	ff 75 08             	pushl  0x8(%ebp)
 6a7:	e8 1f fd ff ff       	call   3cb <write>
        ap++;
 6ac:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6af:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6b2:	31 ff                	xor    %edi,%edi
 6b4:	e9 8f fe ff ff       	jmp    548 <printf+0x48>
          s = "(null)";
 6b9:	bb b0 08 00 00       	mov    $0x8b0,%ebx
        while(*s != 0){
 6be:	b8 28 00 00 00       	mov    $0x28,%eax
 6c3:	e9 72 ff ff ff       	jmp    63a <printf+0x13a>
 6c8:	66 90                	xchg   %ax,%ax
 6ca:	66 90                	xchg   %ax,%ax
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	a1 c0 0b 00 00       	mov    0xbc0,%eax
{
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	57                   	push   %edi
 6d9:	56                   	push   %esi
 6da:	53                   	push   %ebx
 6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e8:	39 c8                	cmp    %ecx,%eax
 6ea:	8b 10                	mov    (%eax),%edx
 6ec:	73 32                	jae    720 <free+0x50>
 6ee:	39 d1                	cmp    %edx,%ecx
 6f0:	72 04                	jb     6f6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f2:	39 d0                	cmp    %edx,%eax
 6f4:	72 32                	jb     728 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6fc:	39 fa                	cmp    %edi,%edx
 6fe:	74 30                	je     730 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 700:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 703:	8b 50 04             	mov    0x4(%eax),%edx
 706:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 709:	39 f1                	cmp    %esi,%ecx
 70b:	74 3a                	je     747 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 70d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 70f:	a3 c0 0b 00 00       	mov    %eax,0xbc0
}
 714:	5b                   	pop    %ebx
 715:	5e                   	pop    %esi
 716:	5f                   	pop    %edi
 717:	5d                   	pop    %ebp
 718:	c3                   	ret    
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 720:	39 d0                	cmp    %edx,%eax
 722:	72 04                	jb     728 <free+0x58>
 724:	39 d1                	cmp    %edx,%ecx
 726:	72 ce                	jb     6f6 <free+0x26>
{
 728:	89 d0                	mov    %edx,%eax
 72a:	eb bc                	jmp    6e8 <free+0x18>
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 730:	03 72 04             	add    0x4(%edx),%esi
 733:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 736:	8b 10                	mov    (%eax),%edx
 738:	8b 12                	mov    (%edx),%edx
 73a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 73d:	8b 50 04             	mov    0x4(%eax),%edx
 740:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 743:	39 f1                	cmp    %esi,%ecx
 745:	75 c6                	jne    70d <free+0x3d>
    p->s.size += bp->s.size;
 747:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 74a:	a3 c0 0b 00 00       	mov    %eax,0xbc0
    p->s.size += bp->s.size;
 74f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 752:	8b 53 f8             	mov    -0x8(%ebx),%edx
 755:	89 10                	mov    %edx,(%eax)
}
 757:	5b                   	pop    %ebx
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 769:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 76c:	8b 15 c0 0b 00 00    	mov    0xbc0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 772:	8d 78 07             	lea    0x7(%eax),%edi
 775:	c1 ef 03             	shr    $0x3,%edi
 778:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 77b:	85 d2                	test   %edx,%edx
 77d:	0f 84 9d 00 00 00    	je     820 <malloc+0xc0>
 783:	8b 02                	mov    (%edx),%eax
 785:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 788:	39 cf                	cmp    %ecx,%edi
 78a:	76 6c                	jbe    7f8 <malloc+0x98>
 78c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 792:	bb 00 10 00 00       	mov    $0x1000,%ebx
 797:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 79a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7a1:	eb 0e                	jmp    7b1 <malloc+0x51>
 7a3:	90                   	nop
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7aa:	8b 48 04             	mov    0x4(%eax),%ecx
 7ad:	39 f9                	cmp    %edi,%ecx
 7af:	73 47                	jae    7f8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7b1:	39 05 c0 0b 00 00    	cmp    %eax,0xbc0
 7b7:	89 c2                	mov    %eax,%edx
 7b9:	75 ed                	jne    7a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7bb:	83 ec 0c             	sub    $0xc,%esp
 7be:	56                   	push   %esi
 7bf:	e8 6f fc ff ff       	call   433 <sbrk>
  if(p == (char*)-1)
 7c4:	83 c4 10             	add    $0x10,%esp
 7c7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ca:	74 1c                	je     7e8 <malloc+0x88>
  hp->s.size = nu;
 7cc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7cf:	83 ec 0c             	sub    $0xc,%esp
 7d2:	83 c0 08             	add    $0x8,%eax
 7d5:	50                   	push   %eax
 7d6:	e8 f5 fe ff ff       	call   6d0 <free>
  return freep;
 7db:	8b 15 c0 0b 00 00    	mov    0xbc0,%edx
      if((p = morecore(nunits)) == 0)
 7e1:	83 c4 10             	add    $0x10,%esp
 7e4:	85 d2                	test   %edx,%edx
 7e6:	75 c0                	jne    7a8 <malloc+0x48>
        return 0;
  }
}
 7e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7eb:	31 c0                	xor    %eax,%eax
}
 7ed:	5b                   	pop    %ebx
 7ee:	5e                   	pop    %esi
 7ef:	5f                   	pop    %edi
 7f0:	5d                   	pop    %ebp
 7f1:	c3                   	ret    
 7f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7f8:	39 cf                	cmp    %ecx,%edi
 7fa:	74 54                	je     850 <malloc+0xf0>
        p->s.size -= nunits;
 7fc:	29 f9                	sub    %edi,%ecx
 7fe:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 801:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 804:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 807:	89 15 c0 0b 00 00    	mov    %edx,0xbc0
}
 80d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 810:	83 c0 08             	add    $0x8,%eax
}
 813:	5b                   	pop    %ebx
 814:	5e                   	pop    %esi
 815:	5f                   	pop    %edi
 816:	5d                   	pop    %ebp
 817:	c3                   	ret    
 818:	90                   	nop
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 820:	c7 05 c0 0b 00 00 c4 	movl   $0xbc4,0xbc0
 827:	0b 00 00 
 82a:	c7 05 c4 0b 00 00 c4 	movl   $0xbc4,0xbc4
 831:	0b 00 00 
    base.s.size = 0;
 834:	b8 c4 0b 00 00       	mov    $0xbc4,%eax
 839:	c7 05 c8 0b 00 00 00 	movl   $0x0,0xbc8
 840:	00 00 00 
 843:	e9 44 ff ff ff       	jmp    78c <malloc+0x2c>
 848:	90                   	nop
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 850:	8b 08                	mov    (%eax),%ecx
 852:	89 0a                	mov    %ecx,(%edx)
 854:	eb b1                	jmp    807 <malloc+0xa7>
