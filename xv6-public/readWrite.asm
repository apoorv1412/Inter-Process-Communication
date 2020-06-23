
_readWrite:     file format elf32-i386


Disassembly of section .text:

00000000 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	8b 45 08             	mov    0x8(%ebp),%eax
   7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
   a:	89 c2                	mov    %eax,%edx
   c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  10:	83 c1 01             	add    $0x1,%ecx
  13:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  17:	83 c2 01             	add    $0x1,%edx
  1a:	84 db                	test   %bl,%bl
  1c:	88 5a ff             	mov    %bl,-0x1(%edx)
  1f:	75 ef                	jne    10 <strcpy+0x10>
    ;
  return os;
}
  21:	5b                   	pop    %ebx
  22:	5d                   	pop    %ebp
  23:	c3                   	ret    
  24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000030 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	53                   	push   %ebx
  34:	8b 55 08             	mov    0x8(%ebp),%edx
  37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  3a:	0f b6 02             	movzbl (%edx),%eax
  3d:	0f b6 19             	movzbl (%ecx),%ebx
  40:	84 c0                	test   %al,%al
  42:	75 1c                	jne    60 <strcmp+0x30>
  44:	eb 2a                	jmp    70 <strcmp+0x40>
  46:	8d 76 00             	lea    0x0(%esi),%esi
  49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  50:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  53:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  56:	83 c1 01             	add    $0x1,%ecx
  59:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
  5c:	84 c0                	test   %al,%al
  5e:	74 10                	je     70 <strcmp+0x40>
  60:	38 d8                	cmp    %bl,%al
  62:	74 ec                	je     50 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  64:	29 d8                	sub    %ebx,%eax
}
  66:	5b                   	pop    %ebx
  67:	5d                   	pop    %ebp
  68:	c3                   	ret    
  69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  70:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  72:	29 d8                	sub    %ebx,%eax
}
  74:	5b                   	pop    %ebx
  75:	5d                   	pop    %ebp
  76:	c3                   	ret    
  77:	89 f6                	mov    %esi,%esi
  79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000080 <strlen>:

uint
strlen(const char *s)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  86:	80 39 00             	cmpb   $0x0,(%ecx)
  89:	74 15                	je     a0 <strlen+0x20>
  8b:	31 d2                	xor    %edx,%edx
  8d:	8d 76 00             	lea    0x0(%esi),%esi
  90:	83 c2 01             	add    $0x1,%edx
  93:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  97:	89 d0                	mov    %edx,%eax
  99:	75 f5                	jne    90 <strlen+0x10>
    ;
  return n;
}
  9b:	5d                   	pop    %ebp
  9c:	c3                   	ret    
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
  a0:	31 c0                	xor    %eax,%eax
}
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    
  a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  bd:	89 d7                	mov    %edx,%edi
  bf:	fc                   	cld    
  c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  c2:	89 d0                	mov    %edx,%eax
  c4:	5f                   	pop    %edi
  c5:	5d                   	pop    %ebp
  c6:	c3                   	ret    
  c7:	89 f6                	mov    %esi,%esi
  c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000d0 <strchr>:

char*
strchr(const char *s, char c)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	53                   	push   %ebx
  d4:	8b 45 08             	mov    0x8(%ebp),%eax
  d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
  da:	0f b6 10             	movzbl (%eax),%edx
  dd:	84 d2                	test   %dl,%dl
  df:	74 1d                	je     fe <strchr+0x2e>
    if(*s == c)
  e1:	38 d3                	cmp    %dl,%bl
  e3:	89 d9                	mov    %ebx,%ecx
  e5:	75 0d                	jne    f4 <strchr+0x24>
  e7:	eb 17                	jmp    100 <strchr+0x30>
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  f0:	38 ca                	cmp    %cl,%dl
  f2:	74 0c                	je     100 <strchr+0x30>
  for(; *s; s++)
  f4:	83 c0 01             	add    $0x1,%eax
  f7:	0f b6 10             	movzbl (%eax),%edx
  fa:	84 d2                	test   %dl,%dl
  fc:	75 f2                	jne    f0 <strchr+0x20>
      return (char*)s;
  return 0;
  fe:	31 c0                	xor    %eax,%eax
}
 100:	5b                   	pop    %ebx
 101:	5d                   	pop    %ebp
 102:	c3                   	ret    
 103:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <gets>:

char*
gets(char *buf, int max)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
 115:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 116:	31 f6                	xor    %esi,%esi
 118:	89 f3                	mov    %esi,%ebx
{
 11a:	83 ec 1c             	sub    $0x1c,%esp
 11d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 120:	eb 2f                	jmp    151 <gets+0x41>
 122:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 128:	8d 45 e7             	lea    -0x19(%ebp),%eax
 12b:	83 ec 04             	sub    $0x4,%esp
 12e:	6a 01                	push   $0x1
 130:	50                   	push   %eax
 131:	6a 00                	push   $0x0
 133:	e8 0b 02 00 00       	call   343 <read>
    if(cc < 1)
 138:	83 c4 10             	add    $0x10,%esp
 13b:	85 c0                	test   %eax,%eax
 13d:	7e 1c                	jle    15b <gets+0x4b>
      break;
    buf[i++] = c;
 13f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 143:	83 c7 01             	add    $0x1,%edi
 146:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 149:	3c 0a                	cmp    $0xa,%al
 14b:	74 23                	je     170 <gets+0x60>
 14d:	3c 0d                	cmp    $0xd,%al
 14f:	74 1f                	je     170 <gets+0x60>
  for(i=0; i+1 < max; ){
 151:	83 c3 01             	add    $0x1,%ebx
 154:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 157:	89 fe                	mov    %edi,%esi
 159:	7c cd                	jl     128 <gets+0x18>
 15b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 160:	c6 03 00             	movb   $0x0,(%ebx)
}
 163:	8d 65 f4             	lea    -0xc(%ebp),%esp
 166:	5b                   	pop    %ebx
 167:	5e                   	pop    %esi
 168:	5f                   	pop    %edi
 169:	5d                   	pop    %ebp
 16a:	c3                   	ret    
 16b:	90                   	nop
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	8b 75 08             	mov    0x8(%ebp),%esi
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	01 de                	add    %ebx,%esi
 178:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 17a:	c6 03 00             	movb   $0x0,(%ebx)
}
 17d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 180:	5b                   	pop    %ebx
 181:	5e                   	pop    %esi
 182:	5f                   	pop    %edi
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
 185:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <stat>:

int
stat(const char *n, struct stat *st)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 195:	83 ec 08             	sub    $0x8,%esp
 198:	6a 00                	push   $0x0
 19a:	ff 75 08             	pushl  0x8(%ebp)
 19d:	e8 c9 01 00 00       	call   36b <open>
  if(fd < 0)
 1a2:	83 c4 10             	add    $0x10,%esp
 1a5:	85 c0                	test   %eax,%eax
 1a7:	78 27                	js     1d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1a9:	83 ec 08             	sub    $0x8,%esp
 1ac:	ff 75 0c             	pushl  0xc(%ebp)
 1af:	89 c3                	mov    %eax,%ebx
 1b1:	50                   	push   %eax
 1b2:	e8 cc 01 00 00       	call   383 <fstat>
  close(fd);
 1b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ba:	89 c6                	mov    %eax,%esi
  close(fd);
 1bc:	e8 92 01 00 00       	call   353 <close>
  return r;
 1c1:	83 c4 10             	add    $0x10,%esp
}
 1c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1c7:	89 f0                	mov    %esi,%eax
 1c9:	5b                   	pop    %ebx
 1ca:	5e                   	pop    %esi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1d5:	eb ed                	jmp    1c4 <stat+0x34>
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <atoi>:

int
atoi(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1e7:	0f be 11             	movsbl (%ecx),%edx
 1ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 1ed:	3c 09                	cmp    $0x9,%al
  n = 0;
 1ef:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 1f4:	77 1f                	ja     215 <atoi+0x35>
 1f6:	8d 76 00             	lea    0x0(%esi),%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 200:	8d 04 80             	lea    (%eax,%eax,4),%eax
 203:	83 c1 01             	add    $0x1,%ecx
 206:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 20a:	0f be 11             	movsbl (%ecx),%edx
 20d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 210:	80 fb 09             	cmp    $0x9,%bl
 213:	76 eb                	jbe    200 <atoi+0x20>
  return n;
}
 215:	5b                   	pop    %ebx
 216:	5d                   	pop    %ebp
 217:	c3                   	ret    
 218:	90                   	nop
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
 225:	8b 5d 10             	mov    0x10(%ebp),%ebx
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 22e:	85 db                	test   %ebx,%ebx
 230:	7e 14                	jle    246 <memmove+0x26>
 232:	31 d2                	xor    %edx,%edx
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 238:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 23c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 23f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 242:	39 d3                	cmp    %edx,%ebx
 244:	75 f2                	jne    238 <memmove+0x18>
  return vdst;
}
 246:	5b                   	pop    %ebx
 247:	5e                   	pop    %esi
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    
 24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000250 <writeBuffer>:

int writeBuffer(char* buff, char* va)
{
 250:	55                   	push   %ebp
  int x = 0;
 251:	31 c9                	xor    %ecx,%ecx
{
 253:	89 e5                	mov    %esp,%ebp
 255:	56                   	push   %esi
 256:	53                   	push   %ebx
 257:	8b 75 0c             	mov    0xc(%ebp),%esi
 25a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char* temp = va;
  while (*buff != '.')
 25d:	89 f0                	mov    %esi,%eax
 25f:	0f b6 13             	movzbl (%ebx),%edx
 262:	eb 09                	jmp    26d <writeBuffer+0x1d>
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  {
    if (*va == 'A')
 268:	80 38 41             	cmpb   $0x41,(%eax)
 26b:	74 13                	je     280 <writeBuffer+0x30>
  while (*buff != '.')
 26d:	80 fa 2e             	cmp    $0x2e,%dl
 270:	75 f6                	jne    268 <writeBuffer+0x18>
        va = temp;
      else
        va++;
    }
  }
  *va = '.';
 272:	c6 00 2e             	movb   $0x2e,(%eax)
  return 1;
}
 275:	b8 01 00 00 00       	mov    $0x1,%eax
 27a:	5b                   	pop    %ebx
 27b:	5e                   	pop    %esi
 27c:	5d                   	pop    %ebp
 27d:	c3                   	ret    
 27e:	66 90                	xchg   %ax,%ax
      x = (x + 1)%4096;
 280:	83 c1 01             	add    $0x1,%ecx
      *va = *buff;
 283:	88 10                	mov    %dl,(%eax)
      buff++;
 285:	83 c3 01             	add    $0x1,%ebx
        va++;
 288:	83 c0 01             	add    $0x1,%eax
 28b:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
 291:	0f 44 c6             	cmove  %esi,%eax
 294:	eb c9                	jmp    25f <writeBuffer+0xf>
 296:	8d 76 00             	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <readBuffer>:

int readBuffer(char* va)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
 2a5:	53                   	push   %ebx
  int c = 0, x = 0;
 2a6:	31 f6                	xor    %esi,%esi
 2a8:	31 db                	xor    %ebx,%ebx
{
 2aa:	83 ec 0c             	sub    $0xc,%esp
  char* temp = va;
  while (*va != '.')
 2ad:	8b 7d 08             	mov    0x8(%ebp),%edi
 2b0:	0f be 07             	movsbl (%edi),%eax
 2b3:	3c 2e                	cmp    $0x2e,%al
 2b5:	74 40                	je     2f7 <readBuffer+0x57>
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  {
    if (*va != 'A')
 2c0:	3c 41                	cmp    $0x41,%al
 2c2:	74 fc                	je     2c0 <readBuffer+0x20>
    {
      printf(1,"%c", *va);
 2c4:	83 ec 04             	sub    $0x4,%esp
      x = (x+1)%4096;
      c++; 
      if (x == 0)
        va = temp;
      else
        va++;
 2c7:	83 c7 01             	add    $0x1,%edi
      c++; 
 2ca:	83 c3 01             	add    $0x1,%ebx
      printf(1,"%c", *va);
 2cd:	50                   	push   %eax
 2ce:	68 d8 07 00 00       	push   $0x7d8
 2d3:	6a 01                	push   $0x1
 2d5:	e8 a6 01 00 00       	call   480 <printf>
      x = (x+1)%4096;
 2da:	8d 56 01             	lea    0x1(%esi),%edx
      *va = 'A';
 2dd:	c6 47 ff 41          	movb   $0x41,-0x1(%edi)
      if (x == 0)
 2e1:	83 c4 10             	add    $0x10,%esp
        va++;
 2e4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 2ea:	0f 44 7d 08          	cmove  0x8(%ebp),%edi
 2ee:	89 d6                	mov    %edx,%esi
  while (*va != '.')
 2f0:	0f be 07             	movsbl (%edi),%eax
 2f3:	3c 2e                	cmp    $0x2e,%al
 2f5:	75 c9                	jne    2c0 <readBuffer+0x20>
    }
  }
  printf(1,"\n");
 2f7:	83 ec 08             	sub    $0x8,%esp
 2fa:	68 db 07 00 00       	push   $0x7db
 2ff:	6a 01                	push   $0x1
 301:	e8 7a 01 00 00       	call   480 <printf>
  printf(1,"The value of the counter is %d\n", c);
 306:	83 c4 0c             	add    $0xc,%esp
 309:	53                   	push   %ebx
 30a:	68 e0 07 00 00       	push   $0x7e0
 30f:	6a 01                	push   $0x1
 311:	e8 6a 01 00 00       	call   480 <printf>
  return 1;
 316:	8d 65 f4             	lea    -0xc(%ebp),%esp
 319:	b8 01 00 00 00       	mov    $0x1,%eax
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    

00000323 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 323:	b8 01 00 00 00       	mov    $0x1,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <exit>:
SYSCALL(exit)
 32b:	b8 02 00 00 00       	mov    $0x2,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <wait>:
SYSCALL(wait)
 333:	b8 03 00 00 00       	mov    $0x3,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <pipe>:
SYSCALL(pipe)
 33b:	b8 04 00 00 00       	mov    $0x4,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <read>:
SYSCALL(read)
 343:	b8 05 00 00 00       	mov    $0x5,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <write>:
SYSCALL(write)
 34b:	b8 10 00 00 00       	mov    $0x10,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <close>:
SYSCALL(close)
 353:	b8 15 00 00 00       	mov    $0x15,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <kill>:
SYSCALL(kill)
 35b:	b8 06 00 00 00       	mov    $0x6,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <exec>:
SYSCALL(exec)
 363:	b8 07 00 00 00       	mov    $0x7,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <open>:
SYSCALL(open)
 36b:	b8 0f 00 00 00       	mov    $0xf,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <mknod>:
SYSCALL(mknod)
 373:	b8 11 00 00 00       	mov    $0x11,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <unlink>:
SYSCALL(unlink)
 37b:	b8 12 00 00 00       	mov    $0x12,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <fstat>:
SYSCALL(fstat)
 383:	b8 08 00 00 00       	mov    $0x8,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <link>:
SYSCALL(link)
 38b:	b8 13 00 00 00       	mov    $0x13,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <mkdir>:
SYSCALL(mkdir)
 393:	b8 14 00 00 00       	mov    $0x14,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <chdir>:
SYSCALL(chdir)
 39b:	b8 09 00 00 00       	mov    $0x9,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <dup>:
SYSCALL(dup)
 3a3:	b8 0a 00 00 00       	mov    $0xa,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <getpid>:
SYSCALL(getpid)
 3ab:	b8 0b 00 00 00       	mov    $0xb,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <sbrk>:
SYSCALL(sbrk)
 3b3:	b8 0c 00 00 00       	mov    $0xc,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <sleep>:
SYSCALL(sleep)
 3bb:	b8 0d 00 00 00       	mov    $0xd,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <uptime>:
SYSCALL(uptime)
 3c3:	b8 0e 00 00 00       	mov    $0xe,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <attachpage>:
SYSCALL(attachpage)
 3cb:	b8 16 00 00 00       	mov    $0x16,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    
 3d3:	66 90                	xchg   %ax,%ax
 3d5:	66 90                	xchg   %ax,%ax
 3d7:	66 90                	xchg   %ax,%ax
 3d9:	66 90                	xchg   %ax,%ax
 3db:	66 90                	xchg   %ax,%ax
 3dd:	66 90                	xchg   %ax,%ax
 3df:	90                   	nop

000003e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3e9:	85 d2                	test   %edx,%edx
{
 3eb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 3ee:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 3f0:	79 76                	jns    468 <printint+0x88>
 3f2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3f6:	74 70                	je     468 <printint+0x88>
    x = -xx;
 3f8:	f7 d8                	neg    %eax
    neg = 1;
 3fa:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 401:	31 f6                	xor    %esi,%esi
 403:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 406:	eb 0a                	jmp    412 <printint+0x32>
 408:	90                   	nop
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 410:	89 fe                	mov    %edi,%esi
 412:	31 d2                	xor    %edx,%edx
 414:	8d 7e 01             	lea    0x1(%esi),%edi
 417:	f7 f1                	div    %ecx
 419:	0f b6 92 08 08 00 00 	movzbl 0x808(%edx),%edx
  }while((x /= base) != 0);
 420:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 422:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 425:	75 e9                	jne    410 <printint+0x30>
  if(neg)
 427:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 42a:	85 c0                	test   %eax,%eax
 42c:	74 08                	je     436 <printint+0x56>
    buf[i++] = '-';
 42e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 433:	8d 7e 02             	lea    0x2(%esi),%edi
 436:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 43a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 43d:	8d 76 00             	lea    0x0(%esi),%esi
 440:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 443:	83 ec 04             	sub    $0x4,%esp
 446:	83 ee 01             	sub    $0x1,%esi
 449:	6a 01                	push   $0x1
 44b:	53                   	push   %ebx
 44c:	57                   	push   %edi
 44d:	88 45 d7             	mov    %al,-0x29(%ebp)
 450:	e8 f6 fe ff ff       	call   34b <write>

  while(--i >= 0)
 455:	83 c4 10             	add    $0x10,%esp
 458:	39 de                	cmp    %ebx,%esi
 45a:	75 e4                	jne    440 <printint+0x60>
    putc(fd, buf[i]);
}
 45c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45f:	5b                   	pop    %ebx
 460:	5e                   	pop    %esi
 461:	5f                   	pop    %edi
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    
 464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 468:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 46f:	eb 90                	jmp    401 <printint+0x21>
 471:	eb 0d                	jmp    480 <printf>
 473:	90                   	nop
 474:	90                   	nop
 475:	90                   	nop
 476:	90                   	nop
 477:	90                   	nop
 478:	90                   	nop
 479:	90                   	nop
 47a:	90                   	nop
 47b:	90                   	nop
 47c:	90                   	nop
 47d:	90                   	nop
 47e:	90                   	nop
 47f:	90                   	nop

00000480 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 489:	8b 75 0c             	mov    0xc(%ebp),%esi
 48c:	0f b6 1e             	movzbl (%esi),%ebx
 48f:	84 db                	test   %bl,%bl
 491:	0f 84 b3 00 00 00    	je     54a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 497:	8d 45 10             	lea    0x10(%ebp),%eax
 49a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 49d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 49f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4a2:	eb 2f                	jmp    4d3 <printf+0x53>
 4a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4a8:	83 f8 25             	cmp    $0x25,%eax
 4ab:	0f 84 a7 00 00 00    	je     558 <printf+0xd8>
  write(fd, &c, 1);
 4b1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4b4:	83 ec 04             	sub    $0x4,%esp
 4b7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 4ba:	6a 01                	push   $0x1
 4bc:	50                   	push   %eax
 4bd:	ff 75 08             	pushl  0x8(%ebp)
 4c0:	e8 86 fe ff ff       	call   34b <write>
 4c5:	83 c4 10             	add    $0x10,%esp
 4c8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 4cb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4cf:	84 db                	test   %bl,%bl
 4d1:	74 77                	je     54a <printf+0xca>
    if(state == 0){
 4d3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 4d5:	0f be cb             	movsbl %bl,%ecx
 4d8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4db:	74 cb                	je     4a8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4dd:	83 ff 25             	cmp    $0x25,%edi
 4e0:	75 e6                	jne    4c8 <printf+0x48>
      if(c == 'd'){
 4e2:	83 f8 64             	cmp    $0x64,%eax
 4e5:	0f 84 05 01 00 00    	je     5f0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4eb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4f1:	83 f9 70             	cmp    $0x70,%ecx
 4f4:	74 72                	je     568 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4f6:	83 f8 73             	cmp    $0x73,%eax
 4f9:	0f 84 99 00 00 00    	je     598 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4ff:	83 f8 63             	cmp    $0x63,%eax
 502:	0f 84 08 01 00 00    	je     610 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 508:	83 f8 25             	cmp    $0x25,%eax
 50b:	0f 84 ef 00 00 00    	je     600 <printf+0x180>
  write(fd, &c, 1);
 511:	8d 45 e7             	lea    -0x19(%ebp),%eax
 514:	83 ec 04             	sub    $0x4,%esp
 517:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 51b:	6a 01                	push   $0x1
 51d:	50                   	push   %eax
 51e:	ff 75 08             	pushl  0x8(%ebp)
 521:	e8 25 fe ff ff       	call   34b <write>
 526:	83 c4 0c             	add    $0xc,%esp
 529:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 52c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 52f:	6a 01                	push   $0x1
 531:	50                   	push   %eax
 532:	ff 75 08             	pushl  0x8(%ebp)
 535:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 538:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 53a:	e8 0c fe ff ff       	call   34b <write>
  for(i = 0; fmt[i]; i++){
 53f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 543:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 546:	84 db                	test   %bl,%bl
 548:	75 89                	jne    4d3 <printf+0x53>
    }
  }
}
 54a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54d:	5b                   	pop    %ebx
 54e:	5e                   	pop    %esi
 54f:	5f                   	pop    %edi
 550:	5d                   	pop    %ebp
 551:	c3                   	ret    
 552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 558:	bf 25 00 00 00       	mov    $0x25,%edi
 55d:	e9 66 ff ff ff       	jmp    4c8 <printf+0x48>
 562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 568:	83 ec 0c             	sub    $0xc,%esp
 56b:	b9 10 00 00 00       	mov    $0x10,%ecx
 570:	6a 00                	push   $0x0
 572:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	8b 17                	mov    (%edi),%edx
 57a:	e8 61 fe ff ff       	call   3e0 <printint>
        ap++;
 57f:	89 f8                	mov    %edi,%eax
 581:	83 c4 10             	add    $0x10,%esp
      state = 0;
 584:	31 ff                	xor    %edi,%edi
        ap++;
 586:	83 c0 04             	add    $0x4,%eax
 589:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 58c:	e9 37 ff ff ff       	jmp    4c8 <printf+0x48>
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 598:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 59b:	8b 08                	mov    (%eax),%ecx
        ap++;
 59d:	83 c0 04             	add    $0x4,%eax
 5a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 5a3:	85 c9                	test   %ecx,%ecx
 5a5:	0f 84 8e 00 00 00    	je     639 <printf+0x1b9>
        while(*s != 0){
 5ab:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 5ae:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 5b0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 5b2:	84 c0                	test   %al,%al
 5b4:	0f 84 0e ff ff ff    	je     4c8 <printf+0x48>
 5ba:	89 75 d0             	mov    %esi,-0x30(%ebp)
 5bd:	89 de                	mov    %ebx,%esi
 5bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5c2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 5c5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5c8:	83 ec 04             	sub    $0x4,%esp
          s++;
 5cb:	83 c6 01             	add    $0x1,%esi
 5ce:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 5d1:	6a 01                	push   $0x1
 5d3:	57                   	push   %edi
 5d4:	53                   	push   %ebx
 5d5:	e8 71 fd ff ff       	call   34b <write>
        while(*s != 0){
 5da:	0f b6 06             	movzbl (%esi),%eax
 5dd:	83 c4 10             	add    $0x10,%esp
 5e0:	84 c0                	test   %al,%al
 5e2:	75 e4                	jne    5c8 <printf+0x148>
 5e4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 5e7:	31 ff                	xor    %edi,%edi
 5e9:	e9 da fe ff ff       	jmp    4c8 <printf+0x48>
 5ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f8:	6a 01                	push   $0x1
 5fa:	e9 73 ff ff ff       	jmp    572 <printf+0xf2>
 5ff:	90                   	nop
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 606:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 609:	6a 01                	push   $0x1
 60b:	e9 21 ff ff ff       	jmp    531 <printf+0xb1>
        putc(fd, *ap);
 610:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 613:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 616:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 618:	6a 01                	push   $0x1
        ap++;
 61a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 61d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 620:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 623:	50                   	push   %eax
 624:	ff 75 08             	pushl  0x8(%ebp)
 627:	e8 1f fd ff ff       	call   34b <write>
        ap++;
 62c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 62f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 632:	31 ff                	xor    %edi,%edi
 634:	e9 8f fe ff ff       	jmp    4c8 <printf+0x48>
          s = "(null)";
 639:	bb 00 08 00 00       	mov    $0x800,%ebx
        while(*s != 0){
 63e:	b8 28 00 00 00       	mov    $0x28,%eax
 643:	e9 72 ff ff ff       	jmp    5ba <printf+0x13a>
 648:	66 90                	xchg   %ax,%ax
 64a:	66 90                	xchg   %ax,%ax
 64c:	66 90                	xchg   %ax,%ax
 64e:	66 90                	xchg   %ax,%ax

00000650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 650:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	a1 e0 0a 00 00       	mov    0xae0,%eax
{
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 65e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 668:	39 c8                	cmp    %ecx,%eax
 66a:	8b 10                	mov    (%eax),%edx
 66c:	73 32                	jae    6a0 <free+0x50>
 66e:	39 d1                	cmp    %edx,%ecx
 670:	72 04                	jb     676 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 672:	39 d0                	cmp    %edx,%eax
 674:	72 32                	jb     6a8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 676:	8b 73 fc             	mov    -0x4(%ebx),%esi
 679:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 67c:	39 fa                	cmp    %edi,%edx
 67e:	74 30                	je     6b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 680:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 683:	8b 50 04             	mov    0x4(%eax),%edx
 686:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 689:	39 f1                	cmp    %esi,%ecx
 68b:	74 3a                	je     6c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 68d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 68f:	a3 e0 0a 00 00       	mov    %eax,0xae0
}
 694:	5b                   	pop    %ebx
 695:	5e                   	pop    %esi
 696:	5f                   	pop    %edi
 697:	5d                   	pop    %ebp
 698:	c3                   	ret    
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a0:	39 d0                	cmp    %edx,%eax
 6a2:	72 04                	jb     6a8 <free+0x58>
 6a4:	39 d1                	cmp    %edx,%ecx
 6a6:	72 ce                	jb     676 <free+0x26>
{
 6a8:	89 d0                	mov    %edx,%eax
 6aa:	eb bc                	jmp    668 <free+0x18>
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6b0:	03 72 04             	add    0x4(%edx),%esi
 6b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b6:	8b 10                	mov    (%eax),%edx
 6b8:	8b 12                	mov    (%edx),%edx
 6ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6bd:	8b 50 04             	mov    0x4(%eax),%edx
 6c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c3:	39 f1                	cmp    %esi,%ecx
 6c5:	75 c6                	jne    68d <free+0x3d>
    p->s.size += bp->s.size;
 6c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6ca:	a3 e0 0a 00 00       	mov    %eax,0xae0
    p->s.size += bp->s.size;
 6cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6d5:	89 10                	mov    %edx,(%eax)
}
 6d7:	5b                   	pop    %ebx
 6d8:	5e                   	pop    %esi
 6d9:	5f                   	pop    %edi
 6da:	5d                   	pop    %ebp
 6db:	c3                   	ret    
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ec:	8b 15 e0 0a 00 00    	mov    0xae0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f2:	8d 78 07             	lea    0x7(%eax),%edi
 6f5:	c1 ef 03             	shr    $0x3,%edi
 6f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6fb:	85 d2                	test   %edx,%edx
 6fd:	0f 84 9d 00 00 00    	je     7a0 <malloc+0xc0>
 703:	8b 02                	mov    (%edx),%eax
 705:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 708:	39 cf                	cmp    %ecx,%edi
 70a:	76 6c                	jbe    778 <malloc+0x98>
 70c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 712:	bb 00 10 00 00       	mov    $0x1000,%ebx
 717:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 71a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 721:	eb 0e                	jmp    731 <malloc+0x51>
 723:	90                   	nop
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 728:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 72a:	8b 48 04             	mov    0x4(%eax),%ecx
 72d:	39 f9                	cmp    %edi,%ecx
 72f:	73 47                	jae    778 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 731:	39 05 e0 0a 00 00    	cmp    %eax,0xae0
 737:	89 c2                	mov    %eax,%edx
 739:	75 ed                	jne    728 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 73b:	83 ec 0c             	sub    $0xc,%esp
 73e:	56                   	push   %esi
 73f:	e8 6f fc ff ff       	call   3b3 <sbrk>
  if(p == (char*)-1)
 744:	83 c4 10             	add    $0x10,%esp
 747:	83 f8 ff             	cmp    $0xffffffff,%eax
 74a:	74 1c                	je     768 <malloc+0x88>
  hp->s.size = nu;
 74c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 74f:	83 ec 0c             	sub    $0xc,%esp
 752:	83 c0 08             	add    $0x8,%eax
 755:	50                   	push   %eax
 756:	e8 f5 fe ff ff       	call   650 <free>
  return freep;
 75b:	8b 15 e0 0a 00 00    	mov    0xae0,%edx
      if((p = morecore(nunits)) == 0)
 761:	83 c4 10             	add    $0x10,%esp
 764:	85 d2                	test   %edx,%edx
 766:	75 c0                	jne    728 <malloc+0x48>
        return 0;
  }
}
 768:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 76b:	31 c0                	xor    %eax,%eax
}
 76d:	5b                   	pop    %ebx
 76e:	5e                   	pop    %esi
 76f:	5f                   	pop    %edi
 770:	5d                   	pop    %ebp
 771:	c3                   	ret    
 772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 778:	39 cf                	cmp    %ecx,%edi
 77a:	74 54                	je     7d0 <malloc+0xf0>
        p->s.size -= nunits;
 77c:	29 f9                	sub    %edi,%ecx
 77e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 781:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 784:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 787:	89 15 e0 0a 00 00    	mov    %edx,0xae0
}
 78d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 790:	83 c0 08             	add    $0x8,%eax
}
 793:	5b                   	pop    %ebx
 794:	5e                   	pop    %esi
 795:	5f                   	pop    %edi
 796:	5d                   	pop    %ebp
 797:	c3                   	ret    
 798:	90                   	nop
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 7a0:	c7 05 e0 0a 00 00 e4 	movl   $0xae4,0xae0
 7a7:	0a 00 00 
 7aa:	c7 05 e4 0a 00 00 e4 	movl   $0xae4,0xae4
 7b1:	0a 00 00 
    base.s.size = 0;
 7b4:	b8 e4 0a 00 00       	mov    $0xae4,%eax
 7b9:	c7 05 e8 0a 00 00 00 	movl   $0x0,0xae8
 7c0:	00 00 00 
 7c3:	e9 44 ff ff ff       	jmp    70c <malloc+0x2c>
 7c8:	90                   	nop
 7c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 7d0:	8b 08                	mov    (%eax),%ecx
 7d2:	89 0a                	mov    %ecx,(%edx)
 7d4:	eb b1                	jmp    787 <malloc+0xa7>
