
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
{
   c:	ff 71 fc             	pushl  -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  16:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi

  for(i = 0; i < 4; i++)
  1c:	31 db                	xor    %ebx,%ebx
{
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  2b:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  32:	74 72 65 
  printf(1, "stressfs starting\n");
  35:	68 18 09 00 00       	push   $0x918
  3a:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  43:	73 66 73 
  printf(1, "stressfs starting\n");
  46:	e8 75 05 00 00       	call   5c0 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 95 01 00 00       	call   1f0 <memset>
  5b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  5e:	e8 00 04 00 00       	call   463 <fork>
  63:	85 c0                	test   %eax,%eax
  65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	83 fb 04             	cmp    $0x4,%ebx
  71:	75 eb                	jne    5e <main+0x5e>
  73:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	53                   	push   %ebx
  7c:	68 2b 09 00 00       	push   $0x92b

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  81:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  86:	6a 01                	push   $0x1
  88:	e8 33 05 00 00       	call   5c0 <printf>
  path[8] += i;
  8d:	89 f8                	mov    %edi,%eax
  8f:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  95:	5f                   	pop    %edi
  96:	58                   	pop    %eax
  97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  9d:	68 02 02 00 00       	push   $0x202
  a2:	50                   	push   %eax
  a3:	e8 03 04 00 00       	call   4ab <open>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	89 c7                	mov    %eax,%edi
  ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 cc 03 00 00       	call   48b <write>
  for(i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
  close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	57                   	push   %edi
  cb:	e8 c3 03 00 00       	call   493 <close>

  printf(1, "read\n");
  d0:	58                   	pop    %eax
  d1:	5a                   	pop    %edx
  d2:	68 35 09 00 00       	push   $0x935
  d7:	6a 01                	push   $0x1
  d9:	e8 e2 04 00 00       	call   5c0 <printf>

  fd = open(path, O_RDONLY);
  de:	59                   	pop    %ecx
  df:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e5:	5b                   	pop    %ebx
  e6:	6a 00                	push   $0x0
  e8:	50                   	push   %eax
  e9:	bb 14 00 00 00       	mov    $0x14,%ebx
  ee:	e8 b8 03 00 00       	call   4ab <open>
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	89 c7                	mov    %eax,%edi
  f8:	90                   	nop
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 74 03 00 00       	call   483 <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 73 03 00 00       	call   493 <close>

  wait();
 120:	e8 4e 03 00 00       	call   473 <wait>

  exit();
 125:	e8 41 03 00 00       	call   46b <exit>
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 45 08             	mov    0x8(%ebp),%eax
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 14a:	89 c2                	mov    %eax,%edx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 150:	83 c1 01             	add    $0x1,%ecx
 153:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 157:	83 c2 01             	add    $0x1,%edx
 15a:	84 db                	test   %bl,%bl
 15c:	88 5a ff             	mov    %bl,-0x1(%edx)
 15f:	75 ef                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 161:	5b                   	pop    %ebx
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 16a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 55 08             	mov    0x8(%ebp),%edx
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17a:	0f b6 02             	movzbl (%edx),%eax
 17d:	0f b6 19             	movzbl (%ecx),%ebx
 180:	84 c0                	test   %al,%al
 182:	75 1c                	jne    1a0 <strcmp+0x30>
 184:	eb 2a                	jmp    1b0 <strcmp+0x40>
 186:	8d 76 00             	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 190:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 193:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 196:	83 c1 01             	add    $0x1,%ecx
 199:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 19c:	84 c0                	test   %al,%al
 19e:	74 10                	je     1b0 <strcmp+0x40>
 1a0:	38 d8                	cmp    %bl,%al
 1a2:	74 ec                	je     190 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1a4:	29 d8                	sub    %ebx,%eax
}
 1a6:	5b                   	pop    %ebx
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret    
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1b2:	29 d8                	sub    %ebx,%eax
}
 1b4:	5b                   	pop    %ebx
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	89 f6                	mov    %esi,%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c6:	80 39 00             	cmpb   $0x0,(%ecx)
 1c9:	74 15                	je     1e0 <strlen+0x20>
 1cb:	31 d2                	xor    %edx,%edx
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	83 c2 01             	add    $0x1,%edx
 1d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1d7:	89 d0                	mov    %edx,%eax
 1d9:	75 f5                	jne    1d0 <strlen+0x10>
    ;
  return n;
}
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1e0:	31 c0                	xor    %eax,%eax
}
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    
 1e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 d7                	mov    %edx,%edi
 1ff:	fc                   	cld    
 200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 202:	89 d0                	mov    %edx,%eax
 204:	5f                   	pop    %edi
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 21a:	0f b6 10             	movzbl (%eax),%edx
 21d:	84 d2                	test   %dl,%dl
 21f:	74 1d                	je     23e <strchr+0x2e>
    if(*s == c)
 221:	38 d3                	cmp    %dl,%bl
 223:	89 d9                	mov    %ebx,%ecx
 225:	75 0d                	jne    234 <strchr+0x24>
 227:	eb 17                	jmp    240 <strchr+0x30>
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 230:	38 ca                	cmp    %cl,%dl
 232:	74 0c                	je     240 <strchr+0x30>
  for(; *s; s++)
 234:	83 c0 01             	add    $0x1,%eax
 237:	0f b6 10             	movzbl (%eax),%edx
 23a:	84 d2                	test   %dl,%dl
 23c:	75 f2                	jne    230 <strchr+0x20>
      return (char*)s;
  return 0;
 23e:	31 c0                	xor    %eax,%eax
}
 240:	5b                   	pop    %ebx
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    
 243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <gets>:

char*
gets(char *buf, int max)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
 255:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 256:	31 f6                	xor    %esi,%esi
 258:	89 f3                	mov    %esi,%ebx
{
 25a:	83 ec 1c             	sub    $0x1c,%esp
 25d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 260:	eb 2f                	jmp    291 <gets+0x41>
 262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 268:	8d 45 e7             	lea    -0x19(%ebp),%eax
 26b:	83 ec 04             	sub    $0x4,%esp
 26e:	6a 01                	push   $0x1
 270:	50                   	push   %eax
 271:	6a 00                	push   $0x0
 273:	e8 0b 02 00 00       	call   483 <read>
    if(cc < 1)
 278:	83 c4 10             	add    $0x10,%esp
 27b:	85 c0                	test   %eax,%eax
 27d:	7e 1c                	jle    29b <gets+0x4b>
      break;
    buf[i++] = c;
 27f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 283:	83 c7 01             	add    $0x1,%edi
 286:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 289:	3c 0a                	cmp    $0xa,%al
 28b:	74 23                	je     2b0 <gets+0x60>
 28d:	3c 0d                	cmp    $0xd,%al
 28f:	74 1f                	je     2b0 <gets+0x60>
  for(i=0; i+1 < max; ){
 291:	83 c3 01             	add    $0x1,%ebx
 294:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 297:	89 fe                	mov    %edi,%esi
 299:	7c cd                	jl     268 <gets+0x18>
 29b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2a0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    
 2ab:	90                   	nop
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b0:	8b 75 08             	mov    0x8(%ebp),%esi
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	01 de                	add    %ebx,%esi
 2b8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2ba:	c6 03 00             	movb   $0x0,(%ebx)
}
 2bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2c0:	5b                   	pop    %ebx
 2c1:	5e                   	pop    %esi
 2c2:	5f                   	pop    %edi
 2c3:	5d                   	pop    %ebp
 2c4:	c3                   	ret    
 2c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	pushl  0x8(%ebp)
 2dd:	e8 c9 01 00 00       	call   4ab <open>
  if(fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	pushl  0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 cc 01 00 00       	call   4c3 <fstat>
  close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
  close(fd);
 2fc:	e8 92 01 00 00       	call   493 <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 11             	movsbl (%ecx),%edx
 32a:	8d 42 d0             	lea    -0x30(%edx),%eax
 32d:	3c 09                	cmp    $0x9,%al
  n = 0;
 32f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 334:	77 1f                	ja     355 <atoi+0x35>
 336:	8d 76 00             	lea    0x0(%esi),%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 340:	8d 04 80             	lea    (%eax,%eax,4),%eax
 343:	83 c1 01             	add    $0x1,%ecx
 346:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 34a:	0f be 11             	movsbl (%ecx),%edx
 34d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	5b                   	pop    %ebx
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	90                   	nop
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
 365:	8b 5d 10             	mov    0x10(%ebp),%ebx
 368:	8b 45 08             	mov    0x8(%ebp),%eax
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 db                	test   %ebx,%ebx
 370:	7e 14                	jle    386 <memmove+0x26>
 372:	31 d2                	xor    %edx,%edx
 374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 378:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 37c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 37f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 382:	39 d3                	cmp    %edx,%ebx
 384:	75 f2                	jne    378 <memmove+0x18>
  return vdst;
}
 386:	5b                   	pop    %ebx
 387:	5e                   	pop    %esi
 388:	5d                   	pop    %ebp
 389:	c3                   	ret    
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000390 <writeBuffer>:

int writeBuffer(char* buff, char* va)
{
 390:	55                   	push   %ebp
  int x = 0;
 391:	31 c9                	xor    %ecx,%ecx
{
 393:	89 e5                	mov    %esp,%ebp
 395:	56                   	push   %esi
 396:	53                   	push   %ebx
 397:	8b 75 0c             	mov    0xc(%ebp),%esi
 39a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char* temp = va;
  while (*buff != '.')
 39d:	89 f0                	mov    %esi,%eax
 39f:	0f b6 13             	movzbl (%ebx),%edx
 3a2:	eb 09                	jmp    3ad <writeBuffer+0x1d>
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  {
    if (*va == 'A')
 3a8:	80 38 41             	cmpb   $0x41,(%eax)
 3ab:	74 13                	je     3c0 <writeBuffer+0x30>
  while (*buff != '.')
 3ad:	80 fa 2e             	cmp    $0x2e,%dl
 3b0:	75 f6                	jne    3a8 <writeBuffer+0x18>
        va = temp;
      else
        va++;
    }
  }
  *va = '.';
 3b2:	c6 00 2e             	movb   $0x2e,(%eax)
  return 1;
}
 3b5:	b8 01 00 00 00       	mov    $0x1,%eax
 3ba:	5b                   	pop    %ebx
 3bb:	5e                   	pop    %esi
 3bc:	5d                   	pop    %ebp
 3bd:	c3                   	ret    
 3be:	66 90                	xchg   %ax,%ax
      x = (x + 1)%4096;
 3c0:	83 c1 01             	add    $0x1,%ecx
      *va = *buff;
 3c3:	88 10                	mov    %dl,(%eax)
      buff++;
 3c5:	83 c3 01             	add    $0x1,%ebx
        va++;
 3c8:	83 c0 01             	add    $0x1,%eax
 3cb:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
 3d1:	0f 44 c6             	cmove  %esi,%eax
 3d4:	eb c9                	jmp    39f <writeBuffer+0xf>
 3d6:	8d 76 00             	lea    0x0(%esi),%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <readBuffer>:

int readBuffer(char* va)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
  int c = 0, x = 0;
 3e6:	31 f6                	xor    %esi,%esi
 3e8:	31 db                	xor    %ebx,%ebx
{
 3ea:	83 ec 0c             	sub    $0xc,%esp
  char* temp = va;
  while (*va != '.')
 3ed:	8b 7d 08             	mov    0x8(%ebp),%edi
 3f0:	0f be 07             	movsbl (%edi),%eax
 3f3:	3c 2e                	cmp    $0x2e,%al
 3f5:	74 40                	je     437 <readBuffer+0x57>
 3f7:	89 f6                	mov    %esi,%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  {
    if (*va != 'A')
 400:	3c 41                	cmp    $0x41,%al
 402:	74 fc                	je     400 <readBuffer+0x20>
    {
      printf(1,"%c", *va);
 404:	83 ec 04             	sub    $0x4,%esp
      x = (x+1)%4096;
      c++; 
      if (x == 0)
        va = temp;
      else
        va++;
 407:	83 c7 01             	add    $0x1,%edi
      c++; 
 40a:	83 c3 01             	add    $0x1,%ebx
      printf(1,"%c", *va);
 40d:	50                   	push   %eax
 40e:	68 3b 09 00 00       	push   $0x93b
 413:	6a 01                	push   $0x1
 415:	e8 a6 01 00 00       	call   5c0 <printf>
      x = (x+1)%4096;
 41a:	8d 56 01             	lea    0x1(%esi),%edx
      *va = 'A';
 41d:	c6 47 ff 41          	movb   $0x41,-0x1(%edi)
      if (x == 0)
 421:	83 c4 10             	add    $0x10,%esp
        va++;
 424:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 42a:	0f 44 7d 08          	cmove  0x8(%ebp),%edi
 42e:	89 d6                	mov    %edx,%esi
  while (*va != '.')
 430:	0f be 07             	movsbl (%edi),%eax
 433:	3c 2e                	cmp    $0x2e,%al
 435:	75 c9                	jne    400 <readBuffer+0x20>
    }
  }
  printf(1,"\n");
 437:	83 ec 08             	sub    $0x8,%esp
 43a:	68 33 09 00 00       	push   $0x933
 43f:	6a 01                	push   $0x1
 441:	e8 7a 01 00 00       	call   5c0 <printf>
  printf(1,"The value of the counter is %d\n", c);
 446:	83 c4 0c             	add    $0xc,%esp
 449:	53                   	push   %ebx
 44a:	68 40 09 00 00       	push   $0x940
 44f:	6a 01                	push   $0x1
 451:	e8 6a 01 00 00       	call   5c0 <printf>
  return 1;
 456:	8d 65 f4             	lea    -0xc(%ebp),%esp
 459:	b8 01 00 00 00       	mov    $0x1,%eax
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5f                   	pop    %edi
 461:	5d                   	pop    %ebp
 462:	c3                   	ret    

00000463 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 463:	b8 01 00 00 00       	mov    $0x1,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <exit>:
SYSCALL(exit)
 46b:	b8 02 00 00 00       	mov    $0x2,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <wait>:
SYSCALL(wait)
 473:	b8 03 00 00 00       	mov    $0x3,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <pipe>:
SYSCALL(pipe)
 47b:	b8 04 00 00 00       	mov    $0x4,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <read>:
SYSCALL(read)
 483:	b8 05 00 00 00       	mov    $0x5,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <write>:
SYSCALL(write)
 48b:	b8 10 00 00 00       	mov    $0x10,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <close>:
SYSCALL(close)
 493:	b8 15 00 00 00       	mov    $0x15,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <kill>:
SYSCALL(kill)
 49b:	b8 06 00 00 00       	mov    $0x6,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <exec>:
SYSCALL(exec)
 4a3:	b8 07 00 00 00       	mov    $0x7,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <open>:
SYSCALL(open)
 4ab:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <mknod>:
SYSCALL(mknod)
 4b3:	b8 11 00 00 00       	mov    $0x11,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <unlink>:
SYSCALL(unlink)
 4bb:	b8 12 00 00 00       	mov    $0x12,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <fstat>:
SYSCALL(fstat)
 4c3:	b8 08 00 00 00       	mov    $0x8,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <link>:
SYSCALL(link)
 4cb:	b8 13 00 00 00       	mov    $0x13,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <mkdir>:
SYSCALL(mkdir)
 4d3:	b8 14 00 00 00       	mov    $0x14,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <chdir>:
SYSCALL(chdir)
 4db:	b8 09 00 00 00       	mov    $0x9,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <dup>:
SYSCALL(dup)
 4e3:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <getpid>:
SYSCALL(getpid)
 4eb:	b8 0b 00 00 00       	mov    $0xb,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <sbrk>:
SYSCALL(sbrk)
 4f3:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <sleep>:
SYSCALL(sleep)
 4fb:	b8 0d 00 00 00       	mov    $0xd,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <uptime>:
SYSCALL(uptime)
 503:	b8 0e 00 00 00       	mov    $0xe,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <attachpage>:
SYSCALL(attachpage)
 50b:	b8 16 00 00 00       	mov    $0x16,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    
 513:	66 90                	xchg   %ax,%ax
 515:	66 90                	xchg   %ax,%ax
 517:	66 90                	xchg   %ax,%ax
 519:	66 90                	xchg   %ax,%ax
 51b:	66 90                	xchg   %ax,%ax
 51d:	66 90                	xchg   %ax,%ax
 51f:	90                   	nop

00000520 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 529:	85 d2                	test   %edx,%edx
{
 52b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 52e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 530:	79 76                	jns    5a8 <printint+0x88>
 532:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 536:	74 70                	je     5a8 <printint+0x88>
    x = -xx;
 538:	f7 d8                	neg    %eax
    neg = 1;
 53a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 541:	31 f6                	xor    %esi,%esi
 543:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 546:	eb 0a                	jmp    552 <printint+0x32>
 548:	90                   	nop
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 550:	89 fe                	mov    %edi,%esi
 552:	31 d2                	xor    %edx,%edx
 554:	8d 7e 01             	lea    0x1(%esi),%edi
 557:	f7 f1                	div    %ecx
 559:	0f b6 92 68 09 00 00 	movzbl 0x968(%edx),%edx
  }while((x /= base) != 0);
 560:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 562:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 565:	75 e9                	jne    550 <printint+0x30>
  if(neg)
 567:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 56a:	85 c0                	test   %eax,%eax
 56c:	74 08                	je     576 <printint+0x56>
    buf[i++] = '-';
 56e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 573:	8d 7e 02             	lea    0x2(%esi),%edi
 576:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 57a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
 580:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 583:	83 ec 04             	sub    $0x4,%esp
 586:	83 ee 01             	sub    $0x1,%esi
 589:	6a 01                	push   $0x1
 58b:	53                   	push   %ebx
 58c:	57                   	push   %edi
 58d:	88 45 d7             	mov    %al,-0x29(%ebp)
 590:	e8 f6 fe ff ff       	call   48b <write>

  while(--i >= 0)
 595:	83 c4 10             	add    $0x10,%esp
 598:	39 de                	cmp    %ebx,%esi
 59a:	75 e4                	jne    580 <printint+0x60>
    putc(fd, buf[i]);
}
 59c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 59f:	5b                   	pop    %ebx
 5a0:	5e                   	pop    %esi
 5a1:	5f                   	pop    %edi
 5a2:	5d                   	pop    %ebp
 5a3:	c3                   	ret    
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5a8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5af:	eb 90                	jmp    541 <printint+0x21>
 5b1:	eb 0d                	jmp    5c0 <printf>
 5b3:	90                   	nop
 5b4:	90                   	nop
 5b5:	90                   	nop
 5b6:	90                   	nop
 5b7:	90                   	nop
 5b8:	90                   	nop
 5b9:	90                   	nop
 5ba:	90                   	nop
 5bb:	90                   	nop
 5bc:	90                   	nop
 5bd:	90                   	nop
 5be:	90                   	nop
 5bf:	90                   	nop

000005c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 5cc:	0f b6 1e             	movzbl (%esi),%ebx
 5cf:	84 db                	test   %bl,%bl
 5d1:	0f 84 b3 00 00 00    	je     68a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 5d7:	8d 45 10             	lea    0x10(%ebp),%eax
 5da:	83 c6 01             	add    $0x1,%esi
  state = 0;
 5dd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 5df:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5e2:	eb 2f                	jmp    613 <printf+0x53>
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5e8:	83 f8 25             	cmp    $0x25,%eax
 5eb:	0f 84 a7 00 00 00    	je     698 <printf+0xd8>
  write(fd, &c, 1);
 5f1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5f4:	83 ec 04             	sub    $0x4,%esp
 5f7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5fa:	6a 01                	push   $0x1
 5fc:	50                   	push   %eax
 5fd:	ff 75 08             	pushl  0x8(%ebp)
 600:	e8 86 fe ff ff       	call   48b <write>
 605:	83 c4 10             	add    $0x10,%esp
 608:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 60b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 60f:	84 db                	test   %bl,%bl
 611:	74 77                	je     68a <printf+0xca>
    if(state == 0){
 613:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 615:	0f be cb             	movsbl %bl,%ecx
 618:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 61b:	74 cb                	je     5e8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 61d:	83 ff 25             	cmp    $0x25,%edi
 620:	75 e6                	jne    608 <printf+0x48>
      if(c == 'd'){
 622:	83 f8 64             	cmp    $0x64,%eax
 625:	0f 84 05 01 00 00    	je     730 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 62b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 631:	83 f9 70             	cmp    $0x70,%ecx
 634:	74 72                	je     6a8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 636:	83 f8 73             	cmp    $0x73,%eax
 639:	0f 84 99 00 00 00    	je     6d8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 63f:	83 f8 63             	cmp    $0x63,%eax
 642:	0f 84 08 01 00 00    	je     750 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 648:	83 f8 25             	cmp    $0x25,%eax
 64b:	0f 84 ef 00 00 00    	je     740 <printf+0x180>
  write(fd, &c, 1);
 651:	8d 45 e7             	lea    -0x19(%ebp),%eax
 654:	83 ec 04             	sub    $0x4,%esp
 657:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 65b:	6a 01                	push   $0x1
 65d:	50                   	push   %eax
 65e:	ff 75 08             	pushl  0x8(%ebp)
 661:	e8 25 fe ff ff       	call   48b <write>
 666:	83 c4 0c             	add    $0xc,%esp
 669:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 66c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 66f:	6a 01                	push   $0x1
 671:	50                   	push   %eax
 672:	ff 75 08             	pushl  0x8(%ebp)
 675:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 678:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 67a:	e8 0c fe ff ff       	call   48b <write>
  for(i = 0; fmt[i]; i++){
 67f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 683:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 686:	84 db                	test   %bl,%bl
 688:	75 89                	jne    613 <printf+0x53>
    }
  }
}
 68a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 68d:	5b                   	pop    %ebx
 68e:	5e                   	pop    %esi
 68f:	5f                   	pop    %edi
 690:	5d                   	pop    %ebp
 691:	c3                   	ret    
 692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 698:	bf 25 00 00 00       	mov    $0x25,%edi
 69d:	e9 66 ff ff ff       	jmp    608 <printf+0x48>
 6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6a8:	83 ec 0c             	sub    $0xc,%esp
 6ab:	b9 10 00 00 00       	mov    $0x10,%ecx
 6b0:	6a 00                	push   $0x0
 6b2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	8b 17                	mov    (%edi),%edx
 6ba:	e8 61 fe ff ff       	call   520 <printint>
        ap++;
 6bf:	89 f8                	mov    %edi,%eax
 6c1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6c4:	31 ff                	xor    %edi,%edi
        ap++;
 6c6:	83 c0 04             	add    $0x4,%eax
 6c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6cc:	e9 37 ff ff ff       	jmp    608 <printf+0x48>
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6db:	8b 08                	mov    (%eax),%ecx
        ap++;
 6dd:	83 c0 04             	add    $0x4,%eax
 6e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 6e3:	85 c9                	test   %ecx,%ecx
 6e5:	0f 84 8e 00 00 00    	je     779 <printf+0x1b9>
        while(*s != 0){
 6eb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 6ee:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 6f0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 6f2:	84 c0                	test   %al,%al
 6f4:	0f 84 0e ff ff ff    	je     608 <printf+0x48>
 6fa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6fd:	89 de                	mov    %ebx,%esi
 6ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 702:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 705:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 708:	83 ec 04             	sub    $0x4,%esp
          s++;
 70b:	83 c6 01             	add    $0x1,%esi
 70e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 711:	6a 01                	push   $0x1
 713:	57                   	push   %edi
 714:	53                   	push   %ebx
 715:	e8 71 fd ff ff       	call   48b <write>
        while(*s != 0){
 71a:	0f b6 06             	movzbl (%esi),%eax
 71d:	83 c4 10             	add    $0x10,%esp
 720:	84 c0                	test   %al,%al
 722:	75 e4                	jne    708 <printf+0x148>
 724:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 727:	31 ff                	xor    %edi,%edi
 729:	e9 da fe ff ff       	jmp    608 <printf+0x48>
 72e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 0a 00 00 00       	mov    $0xa,%ecx
 738:	6a 01                	push   $0x1
 73a:	e9 73 ff ff ff       	jmp    6b2 <printf+0xf2>
 73f:	90                   	nop
  write(fd, &c, 1);
 740:	83 ec 04             	sub    $0x4,%esp
 743:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 746:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 749:	6a 01                	push   $0x1
 74b:	e9 21 ff ff ff       	jmp    671 <printf+0xb1>
        putc(fd, *ap);
 750:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 753:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 756:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 758:	6a 01                	push   $0x1
        ap++;
 75a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 75d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 760:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 763:	50                   	push   %eax
 764:	ff 75 08             	pushl  0x8(%ebp)
 767:	e8 1f fd ff ff       	call   48b <write>
        ap++;
 76c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 76f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 772:	31 ff                	xor    %edi,%edi
 774:	e9 8f fe ff ff       	jmp    608 <printf+0x48>
          s = "(null)";
 779:	bb 60 09 00 00       	mov    $0x960,%ebx
        while(*s != 0){
 77e:	b8 28 00 00 00       	mov    $0x28,%eax
 783:	e9 72 ff ff ff       	jmp    6fa <printf+0x13a>
 788:	66 90                	xchg   %ax,%ax
 78a:	66 90                	xchg   %ax,%ax
 78c:	66 90                	xchg   %ax,%ax
 78e:	66 90                	xchg   %ax,%ax

00000790 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 790:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	a1 70 0c 00 00       	mov    0xc70,%eax
{
 796:	89 e5                	mov    %esp,%ebp
 798:	57                   	push   %edi
 799:	56                   	push   %esi
 79a:	53                   	push   %ebx
 79b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 79e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a8:	39 c8                	cmp    %ecx,%eax
 7aa:	8b 10                	mov    (%eax),%edx
 7ac:	73 32                	jae    7e0 <free+0x50>
 7ae:	39 d1                	cmp    %edx,%ecx
 7b0:	72 04                	jb     7b6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b2:	39 d0                	cmp    %edx,%eax
 7b4:	72 32                	jb     7e8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7bc:	39 fa                	cmp    %edi,%edx
 7be:	74 30                	je     7f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7c3:	8b 50 04             	mov    0x4(%eax),%edx
 7c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c9:	39 f1                	cmp    %esi,%ecx
 7cb:	74 3a                	je     807 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7cd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7cf:	a3 70 0c 00 00       	mov    %eax,0xc70
}
 7d4:	5b                   	pop    %ebx
 7d5:	5e                   	pop    %esi
 7d6:	5f                   	pop    %edi
 7d7:	5d                   	pop    %ebp
 7d8:	c3                   	ret    
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e0:	39 d0                	cmp    %edx,%eax
 7e2:	72 04                	jb     7e8 <free+0x58>
 7e4:	39 d1                	cmp    %edx,%ecx
 7e6:	72 ce                	jb     7b6 <free+0x26>
{
 7e8:	89 d0                	mov    %edx,%eax
 7ea:	eb bc                	jmp    7a8 <free+0x18>
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7f0:	03 72 04             	add    0x4(%edx),%esi
 7f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f6:	8b 10                	mov    (%eax),%edx
 7f8:	8b 12                	mov    (%edx),%edx
 7fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fd:	8b 50 04             	mov    0x4(%eax),%edx
 800:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 803:	39 f1                	cmp    %esi,%ecx
 805:	75 c6                	jne    7cd <free+0x3d>
    p->s.size += bp->s.size;
 807:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 80a:	a3 70 0c 00 00       	mov    %eax,0xc70
    p->s.size += bp->s.size;
 80f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 812:	8b 53 f8             	mov    -0x8(%ebx),%edx
 815:	89 10                	mov    %edx,(%eax)
}
 817:	5b                   	pop    %ebx
 818:	5e                   	pop    %esi
 819:	5f                   	pop    %edi
 81a:	5d                   	pop    %ebp
 81b:	c3                   	ret    
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000820 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 829:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 82c:	8b 15 70 0c 00 00    	mov    0xc70,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 832:	8d 78 07             	lea    0x7(%eax),%edi
 835:	c1 ef 03             	shr    $0x3,%edi
 838:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 83b:	85 d2                	test   %edx,%edx
 83d:	0f 84 9d 00 00 00    	je     8e0 <malloc+0xc0>
 843:	8b 02                	mov    (%edx),%eax
 845:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 848:	39 cf                	cmp    %ecx,%edi
 84a:	76 6c                	jbe    8b8 <malloc+0x98>
 84c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 852:	bb 00 10 00 00       	mov    $0x1000,%ebx
 857:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 85a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 861:	eb 0e                	jmp    871 <malloc+0x51>
 863:	90                   	nop
 864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 868:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 86a:	8b 48 04             	mov    0x4(%eax),%ecx
 86d:	39 f9                	cmp    %edi,%ecx
 86f:	73 47                	jae    8b8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 871:	39 05 70 0c 00 00    	cmp    %eax,0xc70
 877:	89 c2                	mov    %eax,%edx
 879:	75 ed                	jne    868 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 87b:	83 ec 0c             	sub    $0xc,%esp
 87e:	56                   	push   %esi
 87f:	e8 6f fc ff ff       	call   4f3 <sbrk>
  if(p == (char*)-1)
 884:	83 c4 10             	add    $0x10,%esp
 887:	83 f8 ff             	cmp    $0xffffffff,%eax
 88a:	74 1c                	je     8a8 <malloc+0x88>
  hp->s.size = nu;
 88c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 88f:	83 ec 0c             	sub    $0xc,%esp
 892:	83 c0 08             	add    $0x8,%eax
 895:	50                   	push   %eax
 896:	e8 f5 fe ff ff       	call   790 <free>
  return freep;
 89b:	8b 15 70 0c 00 00    	mov    0xc70,%edx
      if((p = morecore(nunits)) == 0)
 8a1:	83 c4 10             	add    $0x10,%esp
 8a4:	85 d2                	test   %edx,%edx
 8a6:	75 c0                	jne    868 <malloc+0x48>
        return 0;
  }
}
 8a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8ab:	31 c0                	xor    %eax,%eax
}
 8ad:	5b                   	pop    %ebx
 8ae:	5e                   	pop    %esi
 8af:	5f                   	pop    %edi
 8b0:	5d                   	pop    %ebp
 8b1:	c3                   	ret    
 8b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8b8:	39 cf                	cmp    %ecx,%edi
 8ba:	74 54                	je     910 <malloc+0xf0>
        p->s.size -= nunits;
 8bc:	29 f9                	sub    %edi,%ecx
 8be:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8c1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8c4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 8c7:	89 15 70 0c 00 00    	mov    %edx,0xc70
}
 8cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8d0:	83 c0 08             	add    $0x8,%eax
}
 8d3:	5b                   	pop    %ebx
 8d4:	5e                   	pop    %esi
 8d5:	5f                   	pop    %edi
 8d6:	5d                   	pop    %ebp
 8d7:	c3                   	ret    
 8d8:	90                   	nop
 8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 8e0:	c7 05 70 0c 00 00 74 	movl   $0xc74,0xc70
 8e7:	0c 00 00 
 8ea:	c7 05 74 0c 00 00 74 	movl   $0xc74,0xc74
 8f1:	0c 00 00 
    base.s.size = 0;
 8f4:	b8 74 0c 00 00       	mov    $0xc74,%eax
 8f9:	c7 05 78 0c 00 00 00 	movl   $0x0,0xc78
 900:	00 00 00 
 903:	e9 44 ff ff ff       	jmp    84c <malloc+0x2c>
 908:	90                   	nop
 909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 910:	8b 08                	mov    (%eax),%ecx
 912:	89 0a                	mov    %ecx,(%edx)
 914:	eb b1                	jmp    8c7 <malloc+0xa7>
