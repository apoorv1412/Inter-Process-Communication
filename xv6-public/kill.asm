
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
  13:	8b 01                	mov    (%ecx),%eax
  15:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  18:	83 f8 01             	cmp    $0x1,%eax
  1b:	7e 2c                	jle    49 <main+0x49>
  1d:	8d 5a 04             	lea    0x4(%edx),%ebx
  20:	8d 34 82             	lea    (%edx,%eax,4),%esi
  23:	90                   	nop
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 33                	pushl  (%ebx)
  2d:	83 c3 04             	add    $0x4,%ebx
  30:	e8 0b 02 00 00       	call   240 <atoi>
  35:	89 04 24             	mov    %eax,(%esp)
  38:	e8 7e 03 00 00       	call   3bb <kill>
  for(i=1; i<argc; i++)
  3d:	83 c4 10             	add    $0x10,%esp
  40:	39 f3                	cmp    %esi,%ebx
  42:	75 e4                	jne    28 <main+0x28>
  exit();
  44:	e8 42 03 00 00       	call   38b <exit>
    printf(2, "usage: kill pid...\n");
  49:	50                   	push   %eax
  4a:	50                   	push   %eax
  4b:	68 38 08 00 00       	push   $0x838
  50:	6a 02                	push   $0x2
  52:	e8 89 04 00 00       	call   4e0 <printf>
    exit();
  57:	e8 2f 03 00 00       	call   38b <exit>
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 45 08             	mov    0x8(%ebp),%eax
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6a:	89 c2                	mov    %eax,%edx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  70:	83 c1 01             	add    $0x1,%ecx
  73:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  77:	83 c2 01             	add    $0x1,%edx
  7a:	84 db                	test   %bl,%bl
  7c:	88 5a ff             	mov    %bl,-0x1(%edx)
  7f:	75 ef                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  81:	5b                   	pop    %ebx
  82:	5d                   	pop    %ebp
  83:	c3                   	ret    
  84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	0f b6 19             	movzbl (%ecx),%ebx
  a0:	84 c0                	test   %al,%al
  a2:	75 1c                	jne    c0 <strcmp+0x30>
  a4:	eb 2a                	jmp    d0 <strcmp+0x40>
  a6:	8d 76 00             	lea    0x0(%esi),%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  b0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  b6:	83 c1 01             	add    $0x1,%ecx
  b9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
  bc:	84 c0                	test   %al,%al
  be:	74 10                	je     d0 <strcmp+0x40>
  c0:	38 d8                	cmp    %bl,%al
  c2:	74 ec                	je     b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  c4:	29 d8                	sub    %ebx,%eax
}
  c6:	5b                   	pop    %ebx
  c7:	5d                   	pop    %ebp
  c8:	c3                   	ret    
  c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  d2:	29 d8                	sub    %ebx,%eax
}
  d4:	5b                   	pop    %ebx
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	89 f6                	mov    %esi,%esi
  d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 39 00             	cmpb   $0x0,(%ecx)
  e9:	74 15                	je     100 <strlen+0x20>
  eb:	31 d2                	xor    %edx,%edx
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c2 01             	add    $0x1,%edx
  f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  f7:	89 d0                	mov    %edx,%eax
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	5d                   	pop    %ebp
  fc:	c3                   	ret    
  fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 100:	31 c0                	xor    %eax,%eax
}
 102:	5d                   	pop    %ebp
 103:	c3                   	ret    
 104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 10a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	89 f6                	mov    %esi,%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 13a:	0f b6 10             	movzbl (%eax),%edx
 13d:	84 d2                	test   %dl,%dl
 13f:	74 1d                	je     15e <strchr+0x2e>
    if(*s == c)
 141:	38 d3                	cmp    %dl,%bl
 143:	89 d9                	mov    %ebx,%ecx
 145:	75 0d                	jne    154 <strchr+0x24>
 147:	eb 17                	jmp    160 <strchr+0x30>
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 150:	38 ca                	cmp    %cl,%dl
 152:	74 0c                	je     160 <strchr+0x30>
  for(; *s; s++)
 154:	83 c0 01             	add    $0x1,%eax
 157:	0f b6 10             	movzbl (%eax),%edx
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strchr+0x20>
      return (char*)s;
  return 0;
 15e:	31 c0                	xor    %eax,%eax
}
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
 175:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 176:	31 f6                	xor    %esi,%esi
 178:	89 f3                	mov    %esi,%ebx
{
 17a:	83 ec 1c             	sub    $0x1c,%esp
 17d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 180:	eb 2f                	jmp    1b1 <gets+0x41>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 188:	8d 45 e7             	lea    -0x19(%ebp),%eax
 18b:	83 ec 04             	sub    $0x4,%esp
 18e:	6a 01                	push   $0x1
 190:	50                   	push   %eax
 191:	6a 00                	push   $0x0
 193:	e8 0b 02 00 00       	call   3a3 <read>
    if(cc < 1)
 198:	83 c4 10             	add    $0x10,%esp
 19b:	85 c0                	test   %eax,%eax
 19d:	7e 1c                	jle    1bb <gets+0x4b>
      break;
    buf[i++] = c;
 19f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a3:	83 c7 01             	add    $0x1,%edi
 1a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1a9:	3c 0a                	cmp    $0xa,%al
 1ab:	74 23                	je     1d0 <gets+0x60>
 1ad:	3c 0d                	cmp    $0xd,%al
 1af:	74 1f                	je     1d0 <gets+0x60>
  for(i=0; i+1 < max; ){
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b7:	89 fe                	mov    %edi,%esi
 1b9:	7c cd                	jl     188 <gets+0x18>
 1bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1c0:	c6 03 00             	movb   $0x0,(%ebx)
}
 1c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c6:	5b                   	pop    %ebx
 1c7:	5e                   	pop    %esi
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	90                   	nop
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d0:	8b 75 08             	mov    0x8(%ebp),%esi
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	01 de                	add    %ebx,%esi
 1d8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1da:	c6 03 00             	movb   $0x0,(%ebx)
}
 1dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e0:	5b                   	pop    %ebx
 1e1:	5e                   	pop    %esi
 1e2:	5f                   	pop    %edi
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    
 1e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	pushl  0x8(%ebp)
 1fd:	e8 c9 01 00 00       	call   3cb <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	pushl  0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 cc 01 00 00       	call   3e3 <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 92 01 00 00       	call   3b3 <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	8d 42 d0             	lea    -0x30(%edx),%eax
 24d:	3c 09                	cmp    $0x9,%al
  n = 0;
 24f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 254:	77 1f                	ja     275 <atoi+0x35>
 256:	8d 76 00             	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 260:	8d 04 80             	lea    (%eax,%eax,4),%eax
 263:	83 c1 01             	add    $0x1,%ecx
 266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 26a:	0f be 11             	movsbl (%ecx),%edx
 26d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	5b                   	pop    %ebx
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
 278:	90                   	nop
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
 285:	8b 5d 10             	mov    0x10(%ebp),%ebx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 db                	test   %ebx,%ebx
 290:	7e 14                	jle    2a6 <memmove+0x26>
 292:	31 d2                	xor    %edx,%edx
 294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 29c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 29f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 2a2:	39 d3                	cmp    %edx,%ebx
 2a4:	75 f2                	jne    298 <memmove+0x18>
  return vdst;
}
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002b0 <writeBuffer>:

int writeBuffer(char* buff, char* va)
{
 2b0:	55                   	push   %ebp
  int x = 0;
 2b1:	31 c9                	xor    %ecx,%ecx
{
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	56                   	push   %esi
 2b6:	53                   	push   %ebx
 2b7:	8b 75 0c             	mov    0xc(%ebp),%esi
 2ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char* temp = va;
  while (*buff != '.')
 2bd:	89 f0                	mov    %esi,%eax
 2bf:	0f b6 13             	movzbl (%ebx),%edx
 2c2:	eb 09                	jmp    2cd <writeBuffer+0x1d>
 2c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  {
    if (*va == 'A')
 2c8:	80 38 41             	cmpb   $0x41,(%eax)
 2cb:	74 13                	je     2e0 <writeBuffer+0x30>
  while (*buff != '.')
 2cd:	80 fa 2e             	cmp    $0x2e,%dl
 2d0:	75 f6                	jne    2c8 <writeBuffer+0x18>
        va = temp;
      else
        va++;
    }
  }
  *va = '.';
 2d2:	c6 00 2e             	movb   $0x2e,(%eax)
  return 1;
}
 2d5:	b8 01 00 00 00       	mov    $0x1,%eax
 2da:	5b                   	pop    %ebx
 2db:	5e                   	pop    %esi
 2dc:	5d                   	pop    %ebp
 2dd:	c3                   	ret    
 2de:	66 90                	xchg   %ax,%ax
      x = (x + 1)%4096;
 2e0:	83 c1 01             	add    $0x1,%ecx
      *va = *buff;
 2e3:	88 10                	mov    %dl,(%eax)
      buff++;
 2e5:	83 c3 01             	add    $0x1,%ebx
        va++;
 2e8:	83 c0 01             	add    $0x1,%eax
 2eb:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
 2f1:	0f 44 c6             	cmove  %esi,%eax
 2f4:	eb c9                	jmp    2bf <writeBuffer+0xf>
 2f6:	8d 76 00             	lea    0x0(%esi),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <readBuffer>:

int readBuffer(char* va)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
 305:	53                   	push   %ebx
  int c = 0, x = 0;
 306:	31 f6                	xor    %esi,%esi
 308:	31 db                	xor    %ebx,%ebx
{
 30a:	83 ec 0c             	sub    $0xc,%esp
  char* temp = va;
  while (*va != '.')
 30d:	8b 7d 08             	mov    0x8(%ebp),%edi
 310:	0f be 07             	movsbl (%edi),%eax
 313:	3c 2e                	cmp    $0x2e,%al
 315:	74 40                	je     357 <readBuffer+0x57>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  {
    if (*va != 'A')
 320:	3c 41                	cmp    $0x41,%al
 322:	74 fc                	je     320 <readBuffer+0x20>
    {
      printf(1,"%c", *va);
 324:	83 ec 04             	sub    $0x4,%esp
      x = (x+1)%4096;
      c++; 
      if (x == 0)
        va = temp;
      else
        va++;
 327:	83 c7 01             	add    $0x1,%edi
      c++; 
 32a:	83 c3 01             	add    $0x1,%ebx
      printf(1,"%c", *va);
 32d:	50                   	push   %eax
 32e:	68 4c 08 00 00       	push   $0x84c
 333:	6a 01                	push   $0x1
 335:	e8 a6 01 00 00       	call   4e0 <printf>
      x = (x+1)%4096;
 33a:	8d 56 01             	lea    0x1(%esi),%edx
      *va = 'A';
 33d:	c6 47 ff 41          	movb   $0x41,-0x1(%edi)
      if (x == 0)
 341:	83 c4 10             	add    $0x10,%esp
        va++;
 344:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 34a:	0f 44 7d 08          	cmove  0x8(%ebp),%edi
 34e:	89 d6                	mov    %edx,%esi
  while (*va != '.')
 350:	0f be 07             	movsbl (%edi),%eax
 353:	3c 2e                	cmp    $0x2e,%al
 355:	75 c9                	jne    320 <readBuffer+0x20>
    }
  }
  printf(1,"\n");
 357:	83 ec 08             	sub    $0x8,%esp
 35a:	68 4a 08 00 00       	push   $0x84a
 35f:	6a 01                	push   $0x1
 361:	e8 7a 01 00 00       	call   4e0 <printf>
  printf(1,"The value of the counter is %d\n", c);
 366:	83 c4 0c             	add    $0xc,%esp
 369:	53                   	push   %ebx
 36a:	68 50 08 00 00       	push   $0x850
 36f:	6a 01                	push   $0x1
 371:	e8 6a 01 00 00       	call   4e0 <printf>
  return 1;
 376:	8d 65 f4             	lea    -0xc(%ebp),%esp
 379:	b8 01 00 00 00       	mov    $0x1,%eax
 37e:	5b                   	pop    %ebx
 37f:	5e                   	pop    %esi
 380:	5f                   	pop    %edi
 381:	5d                   	pop    %ebp
 382:	c3                   	ret    

00000383 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 383:	b8 01 00 00 00       	mov    $0x1,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <exit>:
SYSCALL(exit)
 38b:	b8 02 00 00 00       	mov    $0x2,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <wait>:
SYSCALL(wait)
 393:	b8 03 00 00 00       	mov    $0x3,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <pipe>:
SYSCALL(pipe)
 39b:	b8 04 00 00 00       	mov    $0x4,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <read>:
SYSCALL(read)
 3a3:	b8 05 00 00 00       	mov    $0x5,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <write>:
SYSCALL(write)
 3ab:	b8 10 00 00 00       	mov    $0x10,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <close>:
SYSCALL(close)
 3b3:	b8 15 00 00 00       	mov    $0x15,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <kill>:
SYSCALL(kill)
 3bb:	b8 06 00 00 00       	mov    $0x6,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <exec>:
SYSCALL(exec)
 3c3:	b8 07 00 00 00       	mov    $0x7,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <open>:
SYSCALL(open)
 3cb:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <mknod>:
SYSCALL(mknod)
 3d3:	b8 11 00 00 00       	mov    $0x11,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <unlink>:
SYSCALL(unlink)
 3db:	b8 12 00 00 00       	mov    $0x12,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <fstat>:
SYSCALL(fstat)
 3e3:	b8 08 00 00 00       	mov    $0x8,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <link>:
SYSCALL(link)
 3eb:	b8 13 00 00 00       	mov    $0x13,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <mkdir>:
SYSCALL(mkdir)
 3f3:	b8 14 00 00 00       	mov    $0x14,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <chdir>:
SYSCALL(chdir)
 3fb:	b8 09 00 00 00       	mov    $0x9,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <dup>:
SYSCALL(dup)
 403:	b8 0a 00 00 00       	mov    $0xa,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <getpid>:
SYSCALL(getpid)
 40b:	b8 0b 00 00 00       	mov    $0xb,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <sbrk>:
SYSCALL(sbrk)
 413:	b8 0c 00 00 00       	mov    $0xc,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <sleep>:
SYSCALL(sleep)
 41b:	b8 0d 00 00 00       	mov    $0xd,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <uptime>:
SYSCALL(uptime)
 423:	b8 0e 00 00 00       	mov    $0xe,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <attachpage>:
SYSCALL(attachpage)
 42b:	b8 16 00 00 00       	mov    $0x16,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    
 433:	66 90                	xchg   %ax,%ax
 435:	66 90                	xchg   %ax,%ax
 437:	66 90                	xchg   %ax,%ax
 439:	66 90                	xchg   %ax,%ax
 43b:	66 90                	xchg   %ax,%ax
 43d:	66 90                	xchg   %ax,%ax
 43f:	90                   	nop

00000440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 449:	85 d2                	test   %edx,%edx
{
 44b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 44e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 450:	79 76                	jns    4c8 <printint+0x88>
 452:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 456:	74 70                	je     4c8 <printint+0x88>
    x = -xx;
 458:	f7 d8                	neg    %eax
    neg = 1;
 45a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 461:	31 f6                	xor    %esi,%esi
 463:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 466:	eb 0a                	jmp    472 <printint+0x32>
 468:	90                   	nop
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 470:	89 fe                	mov    %edi,%esi
 472:	31 d2                	xor    %edx,%edx
 474:	8d 7e 01             	lea    0x1(%esi),%edi
 477:	f7 f1                	div    %ecx
 479:	0f b6 92 78 08 00 00 	movzbl 0x878(%edx),%edx
  }while((x /= base) != 0);
 480:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 482:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 485:	75 e9                	jne    470 <printint+0x30>
  if(neg)
 487:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 48a:	85 c0                	test   %eax,%eax
 48c:	74 08                	je     496 <printint+0x56>
    buf[i++] = '-';
 48e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 493:	8d 7e 02             	lea    0x2(%esi),%edi
 496:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 49a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 49d:	8d 76 00             	lea    0x0(%esi),%esi
 4a0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 4a3:	83 ec 04             	sub    $0x4,%esp
 4a6:	83 ee 01             	sub    $0x1,%esi
 4a9:	6a 01                	push   $0x1
 4ab:	53                   	push   %ebx
 4ac:	57                   	push   %edi
 4ad:	88 45 d7             	mov    %al,-0x29(%ebp)
 4b0:	e8 f6 fe ff ff       	call   3ab <write>

  while(--i >= 0)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	39 de                	cmp    %ebx,%esi
 4ba:	75 e4                	jne    4a0 <printint+0x60>
    putc(fd, buf[i]);
}
 4bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bf:	5b                   	pop    %ebx
 4c0:	5e                   	pop    %esi
 4c1:	5f                   	pop    %edi
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4c8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4cf:	eb 90                	jmp    461 <printint+0x21>
 4d1:	eb 0d                	jmp    4e0 <printf>
 4d3:	90                   	nop
 4d4:	90                   	nop
 4d5:	90                   	nop
 4d6:	90                   	nop
 4d7:	90                   	nop
 4d8:	90                   	nop
 4d9:	90                   	nop
 4da:	90                   	nop
 4db:	90                   	nop
 4dc:	90                   	nop
 4dd:	90                   	nop
 4de:	90                   	nop
 4df:	90                   	nop

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4ec:	0f b6 1e             	movzbl (%esi),%ebx
 4ef:	84 db                	test   %bl,%bl
 4f1:	0f 84 b3 00 00 00    	je     5aa <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 4f7:	8d 45 10             	lea    0x10(%ebp),%eax
 4fa:	83 c6 01             	add    $0x1,%esi
  state = 0;
 4fd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 4ff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 502:	eb 2f                	jmp    533 <printf+0x53>
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 508:	83 f8 25             	cmp    $0x25,%eax
 50b:	0f 84 a7 00 00 00    	je     5b8 <printf+0xd8>
  write(fd, &c, 1);
 511:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 514:	83 ec 04             	sub    $0x4,%esp
 517:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 51a:	6a 01                	push   $0x1
 51c:	50                   	push   %eax
 51d:	ff 75 08             	pushl  0x8(%ebp)
 520:	e8 86 fe ff ff       	call   3ab <write>
 525:	83 c4 10             	add    $0x10,%esp
 528:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 52b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 52f:	84 db                	test   %bl,%bl
 531:	74 77                	je     5aa <printf+0xca>
    if(state == 0){
 533:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 535:	0f be cb             	movsbl %bl,%ecx
 538:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 53b:	74 cb                	je     508 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 53d:	83 ff 25             	cmp    $0x25,%edi
 540:	75 e6                	jne    528 <printf+0x48>
      if(c == 'd'){
 542:	83 f8 64             	cmp    $0x64,%eax
 545:	0f 84 05 01 00 00    	je     650 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 54b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 551:	83 f9 70             	cmp    $0x70,%ecx
 554:	74 72                	je     5c8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 556:	83 f8 73             	cmp    $0x73,%eax
 559:	0f 84 99 00 00 00    	je     5f8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 55f:	83 f8 63             	cmp    $0x63,%eax
 562:	0f 84 08 01 00 00    	je     670 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	0f 84 ef 00 00 00    	je     660 <printf+0x180>
  write(fd, &c, 1);
 571:	8d 45 e7             	lea    -0x19(%ebp),%eax
 574:	83 ec 04             	sub    $0x4,%esp
 577:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 57b:	6a 01                	push   $0x1
 57d:	50                   	push   %eax
 57e:	ff 75 08             	pushl  0x8(%ebp)
 581:	e8 25 fe ff ff       	call   3ab <write>
 586:	83 c4 0c             	add    $0xc,%esp
 589:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 58c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 58f:	6a 01                	push   $0x1
 591:	50                   	push   %eax
 592:	ff 75 08             	pushl  0x8(%ebp)
 595:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 598:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 59a:	e8 0c fe ff ff       	call   3ab <write>
  for(i = 0; fmt[i]; i++){
 59f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 5a3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5a6:	84 db                	test   %bl,%bl
 5a8:	75 89                	jne    533 <printf+0x53>
    }
  }
}
 5aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ad:	5b                   	pop    %ebx
 5ae:	5e                   	pop    %esi
 5af:	5f                   	pop    %edi
 5b0:	5d                   	pop    %ebp
 5b1:	c3                   	ret    
 5b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 5b8:	bf 25 00 00 00       	mov    $0x25,%edi
 5bd:	e9 66 ff ff ff       	jmp    528 <printf+0x48>
 5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5c8:	83 ec 0c             	sub    $0xc,%esp
 5cb:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d0:	6a 00                	push   $0x0
 5d2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 5d5:	8b 45 08             	mov    0x8(%ebp),%eax
 5d8:	8b 17                	mov    (%edi),%edx
 5da:	e8 61 fe ff ff       	call   440 <printint>
        ap++;
 5df:	89 f8                	mov    %edi,%eax
 5e1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5e4:	31 ff                	xor    %edi,%edi
        ap++;
 5e6:	83 c0 04             	add    $0x4,%eax
 5e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5ec:	e9 37 ff ff ff       	jmp    528 <printf+0x48>
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5fb:	8b 08                	mov    (%eax),%ecx
        ap++;
 5fd:	83 c0 04             	add    $0x4,%eax
 600:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 603:	85 c9                	test   %ecx,%ecx
 605:	0f 84 8e 00 00 00    	je     699 <printf+0x1b9>
        while(*s != 0){
 60b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 60e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 610:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 612:	84 c0                	test   %al,%al
 614:	0f 84 0e ff ff ff    	je     528 <printf+0x48>
 61a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 61d:	89 de                	mov    %ebx,%esi
 61f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 622:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 625:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 628:	83 ec 04             	sub    $0x4,%esp
          s++;
 62b:	83 c6 01             	add    $0x1,%esi
 62e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 631:	6a 01                	push   $0x1
 633:	57                   	push   %edi
 634:	53                   	push   %ebx
 635:	e8 71 fd ff ff       	call   3ab <write>
        while(*s != 0){
 63a:	0f b6 06             	movzbl (%esi),%eax
 63d:	83 c4 10             	add    $0x10,%esp
 640:	84 c0                	test   %al,%al
 642:	75 e4                	jne    628 <printf+0x148>
 644:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 647:	31 ff                	xor    %edi,%edi
 649:	e9 da fe ff ff       	jmp    528 <printf+0x48>
 64e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 0a 00 00 00       	mov    $0xa,%ecx
 658:	6a 01                	push   $0x1
 65a:	e9 73 ff ff ff       	jmp    5d2 <printf+0xf2>
 65f:	90                   	nop
  write(fd, &c, 1);
 660:	83 ec 04             	sub    $0x4,%esp
 663:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 666:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 669:	6a 01                	push   $0x1
 66b:	e9 21 ff ff ff       	jmp    591 <printf+0xb1>
        putc(fd, *ap);
 670:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 673:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 676:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 678:	6a 01                	push   $0x1
        ap++;
 67a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 67d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 680:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 683:	50                   	push   %eax
 684:	ff 75 08             	pushl  0x8(%ebp)
 687:	e8 1f fd ff ff       	call   3ab <write>
        ap++;
 68c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 68f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 692:	31 ff                	xor    %edi,%edi
 694:	e9 8f fe ff ff       	jmp    528 <printf+0x48>
          s = "(null)";
 699:	bb 70 08 00 00       	mov    $0x870,%ebx
        while(*s != 0){
 69e:	b8 28 00 00 00       	mov    $0x28,%eax
 6a3:	e9 72 ff ff ff       	jmp    61a <printf+0x13a>
 6a8:	66 90                	xchg   %ax,%ax
 6aa:	66 90                	xchg   %ax,%ax
 6ac:	66 90                	xchg   %ax,%ax
 6ae:	66 90                	xchg   %ax,%ax

000006b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	a1 7c 0b 00 00       	mov    0xb7c,%eax
{
 6b6:	89 e5                	mov    %esp,%ebp
 6b8:	57                   	push   %edi
 6b9:	56                   	push   %esi
 6ba:	53                   	push   %ebx
 6bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c8:	39 c8                	cmp    %ecx,%eax
 6ca:	8b 10                	mov    (%eax),%edx
 6cc:	73 32                	jae    700 <free+0x50>
 6ce:	39 d1                	cmp    %edx,%ecx
 6d0:	72 04                	jb     6d6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d2:	39 d0                	cmp    %edx,%eax
 6d4:	72 32                	jb     708 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6d9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6dc:	39 fa                	cmp    %edi,%edx
 6de:	74 30                	je     710 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6e3:	8b 50 04             	mov    0x4(%eax),%edx
 6e6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e9:	39 f1                	cmp    %esi,%ecx
 6eb:	74 3a                	je     727 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6ed:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6ef:	a3 7c 0b 00 00       	mov    %eax,0xb7c
}
 6f4:	5b                   	pop    %ebx
 6f5:	5e                   	pop    %esi
 6f6:	5f                   	pop    %edi
 6f7:	5d                   	pop    %ebp
 6f8:	c3                   	ret    
 6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 700:	39 d0                	cmp    %edx,%eax
 702:	72 04                	jb     708 <free+0x58>
 704:	39 d1                	cmp    %edx,%ecx
 706:	72 ce                	jb     6d6 <free+0x26>
{
 708:	89 d0                	mov    %edx,%eax
 70a:	eb bc                	jmp    6c8 <free+0x18>
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 710:	03 72 04             	add    0x4(%edx),%esi
 713:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 716:	8b 10                	mov    (%eax),%edx
 718:	8b 12                	mov    (%edx),%edx
 71a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 71d:	8b 50 04             	mov    0x4(%eax),%edx
 720:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 723:	39 f1                	cmp    %esi,%ecx
 725:	75 c6                	jne    6ed <free+0x3d>
    p->s.size += bp->s.size;
 727:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 72a:	a3 7c 0b 00 00       	mov    %eax,0xb7c
    p->s.size += bp->s.size;
 72f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 732:	8b 53 f8             	mov    -0x8(%ebx),%edx
 735:	89 10                	mov    %edx,(%eax)
}
 737:	5b                   	pop    %ebx
 738:	5e                   	pop    %esi
 739:	5f                   	pop    %edi
 73a:	5d                   	pop    %ebp
 73b:	c3                   	ret    
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 749:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 74c:	8b 15 7c 0b 00 00    	mov    0xb7c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 752:	8d 78 07             	lea    0x7(%eax),%edi
 755:	c1 ef 03             	shr    $0x3,%edi
 758:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 75b:	85 d2                	test   %edx,%edx
 75d:	0f 84 9d 00 00 00    	je     800 <malloc+0xc0>
 763:	8b 02                	mov    (%edx),%eax
 765:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 768:	39 cf                	cmp    %ecx,%edi
 76a:	76 6c                	jbe    7d8 <malloc+0x98>
 76c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 772:	bb 00 10 00 00       	mov    $0x1000,%ebx
 777:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 77a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 781:	eb 0e                	jmp    791 <malloc+0x51>
 783:	90                   	nop
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 788:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 78a:	8b 48 04             	mov    0x4(%eax),%ecx
 78d:	39 f9                	cmp    %edi,%ecx
 78f:	73 47                	jae    7d8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 791:	39 05 7c 0b 00 00    	cmp    %eax,0xb7c
 797:	89 c2                	mov    %eax,%edx
 799:	75 ed                	jne    788 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 79b:	83 ec 0c             	sub    $0xc,%esp
 79e:	56                   	push   %esi
 79f:	e8 6f fc ff ff       	call   413 <sbrk>
  if(p == (char*)-1)
 7a4:	83 c4 10             	add    $0x10,%esp
 7a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7aa:	74 1c                	je     7c8 <malloc+0x88>
  hp->s.size = nu;
 7ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7af:	83 ec 0c             	sub    $0xc,%esp
 7b2:	83 c0 08             	add    $0x8,%eax
 7b5:	50                   	push   %eax
 7b6:	e8 f5 fe ff ff       	call   6b0 <free>
  return freep;
 7bb:	8b 15 7c 0b 00 00    	mov    0xb7c,%edx
      if((p = morecore(nunits)) == 0)
 7c1:	83 c4 10             	add    $0x10,%esp
 7c4:	85 d2                	test   %edx,%edx
 7c6:	75 c0                	jne    788 <malloc+0x48>
        return 0;
  }
}
 7c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7cb:	31 c0                	xor    %eax,%eax
}
 7cd:	5b                   	pop    %ebx
 7ce:	5e                   	pop    %esi
 7cf:	5f                   	pop    %edi
 7d0:	5d                   	pop    %ebp
 7d1:	c3                   	ret    
 7d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7d8:	39 cf                	cmp    %ecx,%edi
 7da:	74 54                	je     830 <malloc+0xf0>
        p->s.size -= nunits;
 7dc:	29 f9                	sub    %edi,%ecx
 7de:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7e1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7e4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7e7:	89 15 7c 0b 00 00    	mov    %edx,0xb7c
}
 7ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7f0:	83 c0 08             	add    $0x8,%eax
}
 7f3:	5b                   	pop    %ebx
 7f4:	5e                   	pop    %esi
 7f5:	5f                   	pop    %edi
 7f6:	5d                   	pop    %ebp
 7f7:	c3                   	ret    
 7f8:	90                   	nop
 7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 800:	c7 05 7c 0b 00 00 80 	movl   $0xb80,0xb7c
 807:	0b 00 00 
 80a:	c7 05 80 0b 00 00 80 	movl   $0xb80,0xb80
 811:	0b 00 00 
    base.s.size = 0;
 814:	b8 80 0b 00 00       	mov    $0xb80,%eax
 819:	c7 05 84 0b 00 00 00 	movl   $0x0,0xb84
 820:	00 00 00 
 823:	e9 44 ff ff ff       	jmp    76c <malloc+0x2c>
 828:	90                   	nop
 829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 830:	8b 08                	mov    (%eax),%ecx
 832:	89 0a                	mov    %ecx,(%edx)
 834:	eb b1                	jmp    7e7 <malloc+0xa7>
