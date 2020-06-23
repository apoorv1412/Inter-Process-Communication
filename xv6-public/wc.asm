
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 af 04 00 00       	call   4eb <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	85 c0                	test   %eax,%eax
  41:	89 c7                	mov    %eax,%edi
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
    wc(fd, argv[i]);
  4d:	50                   	push   %eax
  4e:	83 c3 04             	add    $0x4,%ebx
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 75 04 00 00       	call   4d3 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 40 04 00 00       	call   4ab <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 7b 09 00 00       	push   $0x97b
  73:	6a 01                	push   $0x1
  75:	e8 86 05 00 00       	call   600 <printf>
      exit();
  7a:	e8 2c 04 00 00       	call   4ab <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 6d 09 00 00       	push   $0x96d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 19 04 00 00       	call   4ab <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  l = w = c = 0;
  a6:	31 db                	xor    %ebx,%ebx
{
  a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  b9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 20 0d 00 00       	push   $0xd20
  cd:	ff 75 08             	pushl  0x8(%ebp)
  d0:	e8 ee 03 00 00       	call   4c3 <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	83 f8 00             	cmp    $0x0,%eax
  db:	89 c6                	mov    %eax,%esi
  dd:	7e 61                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  df:	31 ff                	xor    %edi,%edi
  e1:	eb 13                	jmp    f6 <wc+0x56>
  e3:	90                   	nop
  e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        inword = 0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  ef:	83 c7 01             	add    $0x1,%edi
  f2:	39 fe                	cmp    %edi,%esi
  f4:	74 42                	je     138 <wc+0x98>
      if(buf[i] == '\n')
  f6:	0f be 87 20 0d 00 00 	movsbl 0xd20(%edi),%eax
        l++;
  fd:	31 c9                	xor    %ecx,%ecx
  ff:	3c 0a                	cmp    $0xa,%al
 101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 104:	83 ec 08             	sub    $0x8,%esp
 107:	50                   	push   %eax
 108:	68 58 09 00 00       	push   $0x958
        l++;
 10d:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10f:	e8 3c 01 00 00       	call   250 <strchr>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	75 cd                	jne    e8 <wc+0x48>
      else if(!inword){
 11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11e:	85 d2                	test   %edx,%edx
 120:	75 cd                	jne    ef <wc+0x4f>
    for(i=0; i<n; i++){
 122:	83 c7 01             	add    $0x1,%edi
        w++;
 125:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
 129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 130:	39 fe                	cmp    %edi,%esi
 132:	75 c2                	jne    f6 <wc+0x56>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 138:	01 75 e0             	add    %esi,-0x20(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 140:	75 24                	jne    166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 142:	83 ec 08             	sub    $0x8,%esp
 145:	ff 75 0c             	pushl  0xc(%ebp)
 148:	ff 75 e0             	pushl  -0x20(%ebp)
 14b:	ff 75 dc             	pushl  -0x24(%ebp)
 14e:	53                   	push   %ebx
 14f:	68 6e 09 00 00       	push   $0x96e
 154:	6a 01                	push   $0x1
 156:	e8 a5 04 00 00       	call   600 <printf>
}
 15b:	83 c4 20             	add    $0x20,%esp
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
    printf(1, "wc: read error\n");
 166:	50                   	push   %eax
 167:	50                   	push   %eax
 168:	68 5e 09 00 00       	push   $0x95e
 16d:	6a 01                	push   $0x1
 16f:	e8 8c 04 00 00       	call   600 <printf>
    exit();
 174:	e8 32 03 00 00       	call   4ab <exit>
 179:	66 90                	xchg   %ax,%ax
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 45 08             	mov    0x8(%ebp),%eax
 187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 18a:	89 c2                	mov    %eax,%edx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 190:	83 c1 01             	add    $0x1,%ecx
 193:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 197:	83 c2 01             	add    $0x1,%edx
 19a:	84 db                	test   %bl,%bl
 19c:	88 5a ff             	mov    %bl,-0x1(%edx)
 19f:	75 ef                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 1a1:	5b                   	pop    %ebx
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    
 1a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	0f b6 19             	movzbl (%ecx),%ebx
 1c0:	84 c0                	test   %al,%al
 1c2:	75 1c                	jne    1e0 <strcmp+0x30>
 1c4:	eb 2a                	jmp    1f0 <strcmp+0x40>
 1c6:	8d 76 00             	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1d0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1d6:	83 c1 01             	add    $0x1,%ecx
 1d9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 1dc:	84 c0                	test   %al,%al
 1de:	74 10                	je     1f0 <strcmp+0x40>
 1e0:	38 d8                	cmp    %bl,%al
 1e2:	74 ec                	je     1d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1e4:	29 d8                	sub    %ebx,%eax
}
 1e6:	5b                   	pop    %ebx
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1f2:	29 d8                	sub    %ebx,%eax
}
 1f4:	5b                   	pop    %ebx
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <strlen>:

uint
strlen(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 206:	80 39 00             	cmpb   $0x0,(%ecx)
 209:	74 15                	je     220 <strlen+0x20>
 20b:	31 d2                	xor    %edx,%edx
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	83 c2 01             	add    $0x1,%edx
 213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 217:	89 d0                	mov    %edx,%eax
 219:	75 f5                	jne    210 <strlen+0x10>
    ;
  return n;
}
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 22a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld    
 240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 242:	89 d0                	mov    %edx,%eax
 244:	5f                   	pop    %edi
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	84 d2                	test   %dl,%dl
 25f:	74 1d                	je     27e <strchr+0x2e>
    if(*s == c)
 261:	38 d3                	cmp    %dl,%bl
 263:	89 d9                	mov    %ebx,%ecx
 265:	75 0d                	jne    274 <strchr+0x24>
 267:	eb 17                	jmp    280 <strchr+0x30>
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 270:	38 ca                	cmp    %cl,%dl
 272:	74 0c                	je     280 <strchr+0x30>
  for(; *s; s++)
 274:	83 c0 01             	add    $0x1,%eax
 277:	0f b6 10             	movzbl (%eax),%edx
 27a:	84 d2                	test   %dl,%dl
 27c:	75 f2                	jne    270 <strchr+0x20>
      return (char*)s;
  return 0;
 27e:	31 c0                	xor    %eax,%eax
}
 280:	5b                   	pop    %ebx
 281:	5d                   	pop    %ebp
 282:	c3                   	ret    
 283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
 295:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 296:	31 f6                	xor    %esi,%esi
 298:	89 f3                	mov    %esi,%ebx
{
 29a:	83 ec 1c             	sub    $0x1c,%esp
 29d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2a0:	eb 2f                	jmp    2d1 <gets+0x41>
 2a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2ab:	83 ec 04             	sub    $0x4,%esp
 2ae:	6a 01                	push   $0x1
 2b0:	50                   	push   %eax
 2b1:	6a 00                	push   $0x0
 2b3:	e8 0b 02 00 00       	call   4c3 <read>
    if(cc < 1)
 2b8:	83 c4 10             	add    $0x10,%esp
 2bb:	85 c0                	test   %eax,%eax
 2bd:	7e 1c                	jle    2db <gets+0x4b>
      break;
    buf[i++] = c;
 2bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c3:	83 c7 01             	add    $0x1,%edi
 2c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2c9:	3c 0a                	cmp    $0xa,%al
 2cb:	74 23                	je     2f0 <gets+0x60>
 2cd:	3c 0d                	cmp    $0xd,%al
 2cf:	74 1f                	je     2f0 <gets+0x60>
  for(i=0; i+1 < max; ){
 2d1:	83 c3 01             	add    $0x1,%ebx
 2d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2d7:	89 fe                	mov    %edi,%esi
 2d9:	7c cd                	jl     2a8 <gets+0x18>
 2db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2e0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e6:	5b                   	pop    %ebx
 2e7:	5e                   	pop    %esi
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    
 2eb:	90                   	nop
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f0:	8b 75 08             	mov    0x8(%ebp),%esi
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	01 de                	add    %ebx,%esi
 2f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2fa:	c6 03 00             	movb   $0x0,(%ebx)
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	pushl  0x8(%ebp)
 31d:	e8 c9 01 00 00       	call   4eb <open>
  if(fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	pushl  0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 cc 01 00 00       	call   503 <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 92 01 00 00       	call   4d3 <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	89 f6                	mov    %esi,%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 11             	movsbl (%ecx),%edx
 36a:	8d 42 d0             	lea    -0x30(%edx),%eax
 36d:	3c 09                	cmp    $0x9,%al
  n = 0;
 36f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 374:	77 1f                	ja     395 <atoi+0x35>
 376:	8d 76 00             	lea    0x0(%esi),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 380:	8d 04 80             	lea    (%eax,%eax,4),%eax
 383:	83 c1 01             	add    $0x1,%ecx
 386:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 38a:	0f be 11             	movsbl (%ecx),%edx
 38d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	5b                   	pop    %ebx
 396:	5d                   	pop    %ebp
 397:	c3                   	ret    
 398:	90                   	nop
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
 3a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ae:	85 db                	test   %ebx,%ebx
 3b0:	7e 14                	jle    3c6 <memmove+0x26>
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 3c2:	39 d3                	cmp    %edx,%ebx
 3c4:	75 f2                	jne    3b8 <memmove+0x18>
  return vdst;
}
 3c6:	5b                   	pop    %ebx
 3c7:	5e                   	pop    %esi
 3c8:	5d                   	pop    %ebp
 3c9:	c3                   	ret    
 3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003d0 <writeBuffer>:

int writeBuffer(char* buff, char* va)
{
 3d0:	55                   	push   %ebp
  int x = 0;
 3d1:	31 c9                	xor    %ecx,%ecx
{
 3d3:	89 e5                	mov    %esp,%ebp
 3d5:	56                   	push   %esi
 3d6:	53                   	push   %ebx
 3d7:	8b 75 0c             	mov    0xc(%ebp),%esi
 3da:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char* temp = va;
  while (*buff != '.')
 3dd:	89 f0                	mov    %esi,%eax
 3df:	0f b6 13             	movzbl (%ebx),%edx
 3e2:	eb 09                	jmp    3ed <writeBuffer+0x1d>
 3e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  {
    if (*va == 'A')
 3e8:	80 38 41             	cmpb   $0x41,(%eax)
 3eb:	74 13                	je     400 <writeBuffer+0x30>
  while (*buff != '.')
 3ed:	80 fa 2e             	cmp    $0x2e,%dl
 3f0:	75 f6                	jne    3e8 <writeBuffer+0x18>
        va = temp;
      else
        va++;
    }
  }
  *va = '.';
 3f2:	c6 00 2e             	movb   $0x2e,(%eax)
  return 1;
}
 3f5:	b8 01 00 00 00       	mov    $0x1,%eax
 3fa:	5b                   	pop    %ebx
 3fb:	5e                   	pop    %esi
 3fc:	5d                   	pop    %ebp
 3fd:	c3                   	ret    
 3fe:	66 90                	xchg   %ax,%ax
      x = (x + 1)%4096;
 400:	83 c1 01             	add    $0x1,%ecx
      *va = *buff;
 403:	88 10                	mov    %dl,(%eax)
      buff++;
 405:	83 c3 01             	add    $0x1,%ebx
        va++;
 408:	83 c0 01             	add    $0x1,%eax
 40b:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
 411:	0f 44 c6             	cmove  %esi,%eax
 414:	eb c9                	jmp    3df <writeBuffer+0xf>
 416:	8d 76 00             	lea    0x0(%esi),%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <readBuffer>:

int readBuffer(char* va)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
  int c = 0, x = 0;
 426:	31 f6                	xor    %esi,%esi
 428:	31 db                	xor    %ebx,%ebx
{
 42a:	83 ec 0c             	sub    $0xc,%esp
  char* temp = va;
  while (*va != '.')
 42d:	8b 7d 08             	mov    0x8(%ebp),%edi
 430:	0f be 07             	movsbl (%edi),%eax
 433:	3c 2e                	cmp    $0x2e,%al
 435:	74 40                	je     477 <readBuffer+0x57>
 437:	89 f6                	mov    %esi,%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  {
    if (*va != 'A')
 440:	3c 41                	cmp    $0x41,%al
 442:	74 fc                	je     440 <readBuffer+0x20>
    {
      printf(1,"%c", *va);
 444:	83 ec 04             	sub    $0x4,%esp
      x = (x+1)%4096;
      c++; 
      if (x == 0)
        va = temp;
      else
        va++;
 447:	83 c7 01             	add    $0x1,%edi
      c++; 
 44a:	83 c3 01             	add    $0x1,%ebx
      printf(1,"%c", *va);
 44d:	50                   	push   %eax
 44e:	68 8f 09 00 00       	push   $0x98f
 453:	6a 01                	push   $0x1
 455:	e8 a6 01 00 00       	call   600 <printf>
      x = (x+1)%4096;
 45a:	8d 56 01             	lea    0x1(%esi),%edx
      *va = 'A';
 45d:	c6 47 ff 41          	movb   $0x41,-0x1(%edi)
      if (x == 0)
 461:	83 c4 10             	add    $0x10,%esp
        va++;
 464:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 46a:	0f 44 7d 08          	cmove  0x8(%ebp),%edi
 46e:	89 d6                	mov    %edx,%esi
  while (*va != '.')
 470:	0f be 07             	movsbl (%edi),%eax
 473:	3c 2e                	cmp    $0x2e,%al
 475:	75 c9                	jne    440 <readBuffer+0x20>
    }
  }
  printf(1,"\n");
 477:	83 ec 08             	sub    $0x8,%esp
 47a:	68 6c 09 00 00       	push   $0x96c
 47f:	6a 01                	push   $0x1
 481:	e8 7a 01 00 00       	call   600 <printf>
  printf(1,"The value of the counter is %d\n", c);
 486:	83 c4 0c             	add    $0xc,%esp
 489:	53                   	push   %ebx
 48a:	68 94 09 00 00       	push   $0x994
 48f:	6a 01                	push   $0x1
 491:	e8 6a 01 00 00       	call   600 <printf>
  return 1;
 496:	8d 65 f4             	lea    -0xc(%ebp),%esp
 499:	b8 01 00 00 00       	mov    $0x1,%eax
 49e:	5b                   	pop    %ebx
 49f:	5e                   	pop    %esi
 4a0:	5f                   	pop    %edi
 4a1:	5d                   	pop    %ebp
 4a2:	c3                   	ret    

000004a3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4a3:	b8 01 00 00 00       	mov    $0x1,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <exit>:
SYSCALL(exit)
 4ab:	b8 02 00 00 00       	mov    $0x2,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <wait>:
SYSCALL(wait)
 4b3:	b8 03 00 00 00       	mov    $0x3,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <pipe>:
SYSCALL(pipe)
 4bb:	b8 04 00 00 00       	mov    $0x4,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <read>:
SYSCALL(read)
 4c3:	b8 05 00 00 00       	mov    $0x5,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <write>:
SYSCALL(write)
 4cb:	b8 10 00 00 00       	mov    $0x10,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <close>:
SYSCALL(close)
 4d3:	b8 15 00 00 00       	mov    $0x15,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <kill>:
SYSCALL(kill)
 4db:	b8 06 00 00 00       	mov    $0x6,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <exec>:
SYSCALL(exec)
 4e3:	b8 07 00 00 00       	mov    $0x7,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <open>:
SYSCALL(open)
 4eb:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <mknod>:
SYSCALL(mknod)
 4f3:	b8 11 00 00 00       	mov    $0x11,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <unlink>:
SYSCALL(unlink)
 4fb:	b8 12 00 00 00       	mov    $0x12,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <fstat>:
SYSCALL(fstat)
 503:	b8 08 00 00 00       	mov    $0x8,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <link>:
SYSCALL(link)
 50b:	b8 13 00 00 00       	mov    $0x13,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <mkdir>:
SYSCALL(mkdir)
 513:	b8 14 00 00 00       	mov    $0x14,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <chdir>:
SYSCALL(chdir)
 51b:	b8 09 00 00 00       	mov    $0x9,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <dup>:
SYSCALL(dup)
 523:	b8 0a 00 00 00       	mov    $0xa,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <getpid>:
SYSCALL(getpid)
 52b:	b8 0b 00 00 00       	mov    $0xb,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <sbrk>:
SYSCALL(sbrk)
 533:	b8 0c 00 00 00       	mov    $0xc,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <sleep>:
SYSCALL(sleep)
 53b:	b8 0d 00 00 00       	mov    $0xd,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <uptime>:
SYSCALL(uptime)
 543:	b8 0e 00 00 00       	mov    $0xe,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <attachpage>:
SYSCALL(attachpage)
 54b:	b8 16 00 00 00       	mov    $0x16,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    
 553:	66 90                	xchg   %ax,%ax
 555:	66 90                	xchg   %ax,%ax
 557:	66 90                	xchg   %ax,%ax
 559:	66 90                	xchg   %ax,%ax
 55b:	66 90                	xchg   %ax,%ax
 55d:	66 90                	xchg   %ax,%ax
 55f:	90                   	nop

00000560 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 569:	85 d2                	test   %edx,%edx
{
 56b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 56e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 570:	79 76                	jns    5e8 <printint+0x88>
 572:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 576:	74 70                	je     5e8 <printint+0x88>
    x = -xx;
 578:	f7 d8                	neg    %eax
    neg = 1;
 57a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 581:	31 f6                	xor    %esi,%esi
 583:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 586:	eb 0a                	jmp    592 <printint+0x32>
 588:	90                   	nop
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 590:	89 fe                	mov    %edi,%esi
 592:	31 d2                	xor    %edx,%edx
 594:	8d 7e 01             	lea    0x1(%esi),%edi
 597:	f7 f1                	div    %ecx
 599:	0f b6 92 bc 09 00 00 	movzbl 0x9bc(%edx),%edx
  }while((x /= base) != 0);
 5a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 5a2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 5a5:	75 e9                	jne    590 <printint+0x30>
  if(neg)
 5a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5aa:	85 c0                	test   %eax,%eax
 5ac:	74 08                	je     5b6 <printint+0x56>
    buf[i++] = '-';
 5ae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 5b3:	8d 7e 02             	lea    0x2(%esi),%edi
 5b6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 5ba:	8b 7d c0             	mov    -0x40(%ebp),%edi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
 5c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
 5c6:	83 ee 01             	sub    $0x1,%esi
 5c9:	6a 01                	push   $0x1
 5cb:	53                   	push   %ebx
 5cc:	57                   	push   %edi
 5cd:	88 45 d7             	mov    %al,-0x29(%ebp)
 5d0:	e8 f6 fe ff ff       	call   4cb <write>

  while(--i >= 0)
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	39 de                	cmp    %ebx,%esi
 5da:	75 e4                	jne    5c0 <printint+0x60>
    putc(fd, buf[i]);
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5e8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5ef:	eb 90                	jmp    581 <printint+0x21>
 5f1:	eb 0d                	jmp    600 <printf>
 5f3:	90                   	nop
 5f4:	90                   	nop
 5f5:	90                   	nop
 5f6:	90                   	nop
 5f7:	90                   	nop
 5f8:	90                   	nop
 5f9:	90                   	nop
 5fa:	90                   	nop
 5fb:	90                   	nop
 5fc:	90                   	nop
 5fd:	90                   	nop
 5fe:	90                   	nop
 5ff:	90                   	nop

00000600 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 609:	8b 75 0c             	mov    0xc(%ebp),%esi
 60c:	0f b6 1e             	movzbl (%esi),%ebx
 60f:	84 db                	test   %bl,%bl
 611:	0f 84 b3 00 00 00    	je     6ca <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 617:	8d 45 10             	lea    0x10(%ebp),%eax
 61a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 61d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 61f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 622:	eb 2f                	jmp    653 <printf+0x53>
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	0f 84 a7 00 00 00    	je     6d8 <printf+0xd8>
  write(fd, &c, 1);
 631:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 634:	83 ec 04             	sub    $0x4,%esp
 637:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 63a:	6a 01                	push   $0x1
 63c:	50                   	push   %eax
 63d:	ff 75 08             	pushl  0x8(%ebp)
 640:	e8 86 fe ff ff       	call   4cb <write>
 645:	83 c4 10             	add    $0x10,%esp
 648:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 64b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 64f:	84 db                	test   %bl,%bl
 651:	74 77                	je     6ca <printf+0xca>
    if(state == 0){
 653:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 655:	0f be cb             	movsbl %bl,%ecx
 658:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 65b:	74 cb                	je     628 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 65d:	83 ff 25             	cmp    $0x25,%edi
 660:	75 e6                	jne    648 <printf+0x48>
      if(c == 'd'){
 662:	83 f8 64             	cmp    $0x64,%eax
 665:	0f 84 05 01 00 00    	je     770 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 66b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 671:	83 f9 70             	cmp    $0x70,%ecx
 674:	74 72                	je     6e8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 676:	83 f8 73             	cmp    $0x73,%eax
 679:	0f 84 99 00 00 00    	je     718 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 67f:	83 f8 63             	cmp    $0x63,%eax
 682:	0f 84 08 01 00 00    	je     790 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	0f 84 ef 00 00 00    	je     780 <printf+0x180>
  write(fd, &c, 1);
 691:	8d 45 e7             	lea    -0x19(%ebp),%eax
 694:	83 ec 04             	sub    $0x4,%esp
 697:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 69b:	6a 01                	push   $0x1
 69d:	50                   	push   %eax
 69e:	ff 75 08             	pushl  0x8(%ebp)
 6a1:	e8 25 fe ff ff       	call   4cb <write>
 6a6:	83 c4 0c             	add    $0xc,%esp
 6a9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 6ac:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 6af:	6a 01                	push   $0x1
 6b1:	50                   	push   %eax
 6b2:	ff 75 08             	pushl  0x8(%ebp)
 6b5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6b8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6ba:	e8 0c fe ff ff       	call   4cb <write>
  for(i = 0; fmt[i]; i++){
 6bf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 6c3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6c6:	84 db                	test   %bl,%bl
 6c8:	75 89                	jne    653 <printf+0x53>
    }
  }
}
 6ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cd:	5b                   	pop    %ebx
 6ce:	5e                   	pop    %esi
 6cf:	5f                   	pop    %edi
 6d0:	5d                   	pop    %ebp
 6d1:	c3                   	ret    
 6d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 6d8:	bf 25 00 00 00       	mov    $0x25,%edi
 6dd:	e9 66 ff ff ff       	jmp    648 <printf+0x48>
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6e8:	83 ec 0c             	sub    $0xc,%esp
 6eb:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f0:	6a 00                	push   $0x0
 6f2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	8b 17                	mov    (%edi),%edx
 6fa:	e8 61 fe ff ff       	call   560 <printint>
        ap++;
 6ff:	89 f8                	mov    %edi,%eax
 701:	83 c4 10             	add    $0x10,%esp
      state = 0;
 704:	31 ff                	xor    %edi,%edi
        ap++;
 706:	83 c0 04             	add    $0x4,%eax
 709:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 70c:	e9 37 ff ff ff       	jmp    648 <printf+0x48>
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 718:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 71b:	8b 08                	mov    (%eax),%ecx
        ap++;
 71d:	83 c0 04             	add    $0x4,%eax
 720:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 723:	85 c9                	test   %ecx,%ecx
 725:	0f 84 8e 00 00 00    	je     7b9 <printf+0x1b9>
        while(*s != 0){
 72b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 72e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 730:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 732:	84 c0                	test   %al,%al
 734:	0f 84 0e ff ff ff    	je     648 <printf+0x48>
 73a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 73d:	89 de                	mov    %ebx,%esi
 73f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 742:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 745:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 748:	83 ec 04             	sub    $0x4,%esp
          s++;
 74b:	83 c6 01             	add    $0x1,%esi
 74e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 751:	6a 01                	push   $0x1
 753:	57                   	push   %edi
 754:	53                   	push   %ebx
 755:	e8 71 fd ff ff       	call   4cb <write>
        while(*s != 0){
 75a:	0f b6 06             	movzbl (%esi),%eax
 75d:	83 c4 10             	add    $0x10,%esp
 760:	84 c0                	test   %al,%al
 762:	75 e4                	jne    748 <printf+0x148>
 764:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 767:	31 ff                	xor    %edi,%edi
 769:	e9 da fe ff ff       	jmp    648 <printf+0x48>
 76e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 770:	83 ec 0c             	sub    $0xc,%esp
 773:	b9 0a 00 00 00       	mov    $0xa,%ecx
 778:	6a 01                	push   $0x1
 77a:	e9 73 ff ff ff       	jmp    6f2 <printf+0xf2>
 77f:	90                   	nop
  write(fd, &c, 1);
 780:	83 ec 04             	sub    $0x4,%esp
 783:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 786:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 789:	6a 01                	push   $0x1
 78b:	e9 21 ff ff ff       	jmp    6b1 <printf+0xb1>
        putc(fd, *ap);
 790:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 793:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 796:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 798:	6a 01                	push   $0x1
        ap++;
 79a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 79d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 7a0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7a3:	50                   	push   %eax
 7a4:	ff 75 08             	pushl  0x8(%ebp)
 7a7:	e8 1f fd ff ff       	call   4cb <write>
        ap++;
 7ac:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 7af:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7b2:	31 ff                	xor    %edi,%edi
 7b4:	e9 8f fe ff ff       	jmp    648 <printf+0x48>
          s = "(null)";
 7b9:	bb b4 09 00 00       	mov    $0x9b4,%ebx
        while(*s != 0){
 7be:	b8 28 00 00 00       	mov    $0x28,%eax
 7c3:	e9 72 ff ff ff       	jmp    73a <printf+0x13a>
 7c8:	66 90                	xchg   %ax,%ax
 7ca:	66 90                	xchg   %ax,%ax
 7cc:	66 90                	xchg   %ax,%ax
 7ce:	66 90                	xchg   %ax,%ax

000007d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	a1 00 0d 00 00       	mov    0xd00,%eax
{
 7d6:	89 e5                	mov    %esp,%ebp
 7d8:	57                   	push   %edi
 7d9:	56                   	push   %esi
 7da:	53                   	push   %ebx
 7db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 7e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e8:	39 c8                	cmp    %ecx,%eax
 7ea:	8b 10                	mov    (%eax),%edx
 7ec:	73 32                	jae    820 <free+0x50>
 7ee:	39 d1                	cmp    %edx,%ecx
 7f0:	72 04                	jb     7f6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f2:	39 d0                	cmp    %edx,%eax
 7f4:	72 32                	jb     828 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fc:	39 fa                	cmp    %edi,%edx
 7fe:	74 30                	je     830 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 800:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 803:	8b 50 04             	mov    0x4(%eax),%edx
 806:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 809:	39 f1                	cmp    %esi,%ecx
 80b:	74 3a                	je     847 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 80d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 80f:	a3 00 0d 00 00       	mov    %eax,0xd00
}
 814:	5b                   	pop    %ebx
 815:	5e                   	pop    %esi
 816:	5f                   	pop    %edi
 817:	5d                   	pop    %ebp
 818:	c3                   	ret    
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 820:	39 d0                	cmp    %edx,%eax
 822:	72 04                	jb     828 <free+0x58>
 824:	39 d1                	cmp    %edx,%ecx
 826:	72 ce                	jb     7f6 <free+0x26>
{
 828:	89 d0                	mov    %edx,%eax
 82a:	eb bc                	jmp    7e8 <free+0x18>
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 830:	03 72 04             	add    0x4(%edx),%esi
 833:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 836:	8b 10                	mov    (%eax),%edx
 838:	8b 12                	mov    (%edx),%edx
 83a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 83d:	8b 50 04             	mov    0x4(%eax),%edx
 840:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 843:	39 f1                	cmp    %esi,%ecx
 845:	75 c6                	jne    80d <free+0x3d>
    p->s.size += bp->s.size;
 847:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 84a:	a3 00 0d 00 00       	mov    %eax,0xd00
    p->s.size += bp->s.size;
 84f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 852:	8b 53 f8             	mov    -0x8(%ebx),%edx
 855:	89 10                	mov    %edx,(%eax)
}
 857:	5b                   	pop    %ebx
 858:	5e                   	pop    %esi
 859:	5f                   	pop    %edi
 85a:	5d                   	pop    %ebp
 85b:	c3                   	ret    
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000860 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	57                   	push   %edi
 864:	56                   	push   %esi
 865:	53                   	push   %ebx
 866:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 869:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 86c:	8b 15 00 0d 00 00    	mov    0xd00,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 872:	8d 78 07             	lea    0x7(%eax),%edi
 875:	c1 ef 03             	shr    $0x3,%edi
 878:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 87b:	85 d2                	test   %edx,%edx
 87d:	0f 84 9d 00 00 00    	je     920 <malloc+0xc0>
 883:	8b 02                	mov    (%edx),%eax
 885:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 888:	39 cf                	cmp    %ecx,%edi
 88a:	76 6c                	jbe    8f8 <malloc+0x98>
 88c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 892:	bb 00 10 00 00       	mov    $0x1000,%ebx
 897:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 89a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8a1:	eb 0e                	jmp    8b1 <malloc+0x51>
 8a3:	90                   	nop
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8aa:	8b 48 04             	mov    0x4(%eax),%ecx
 8ad:	39 f9                	cmp    %edi,%ecx
 8af:	73 47                	jae    8f8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8b1:	39 05 00 0d 00 00    	cmp    %eax,0xd00
 8b7:	89 c2                	mov    %eax,%edx
 8b9:	75 ed                	jne    8a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8bb:	83 ec 0c             	sub    $0xc,%esp
 8be:	56                   	push   %esi
 8bf:	e8 6f fc ff ff       	call   533 <sbrk>
  if(p == (char*)-1)
 8c4:	83 c4 10             	add    $0x10,%esp
 8c7:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ca:	74 1c                	je     8e8 <malloc+0x88>
  hp->s.size = nu;
 8cc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8cf:	83 ec 0c             	sub    $0xc,%esp
 8d2:	83 c0 08             	add    $0x8,%eax
 8d5:	50                   	push   %eax
 8d6:	e8 f5 fe ff ff       	call   7d0 <free>
  return freep;
 8db:	8b 15 00 0d 00 00    	mov    0xd00,%edx
      if((p = morecore(nunits)) == 0)
 8e1:	83 c4 10             	add    $0x10,%esp
 8e4:	85 d2                	test   %edx,%edx
 8e6:	75 c0                	jne    8a8 <malloc+0x48>
        return 0;
  }
}
 8e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8eb:	31 c0                	xor    %eax,%eax
}
 8ed:	5b                   	pop    %ebx
 8ee:	5e                   	pop    %esi
 8ef:	5f                   	pop    %edi
 8f0:	5d                   	pop    %ebp
 8f1:	c3                   	ret    
 8f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8f8:	39 cf                	cmp    %ecx,%edi
 8fa:	74 54                	je     950 <malloc+0xf0>
        p->s.size -= nunits;
 8fc:	29 f9                	sub    %edi,%ecx
 8fe:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 901:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 904:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 907:	89 15 00 0d 00 00    	mov    %edx,0xd00
}
 90d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 910:	83 c0 08             	add    $0x8,%eax
}
 913:	5b                   	pop    %ebx
 914:	5e                   	pop    %esi
 915:	5f                   	pop    %edi
 916:	5d                   	pop    %ebp
 917:	c3                   	ret    
 918:	90                   	nop
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 920:	c7 05 00 0d 00 00 04 	movl   $0xd04,0xd00
 927:	0d 00 00 
 92a:	c7 05 04 0d 00 00 04 	movl   $0xd04,0xd04
 931:	0d 00 00 
    base.s.size = 0;
 934:	b8 04 0d 00 00       	mov    $0xd04,%eax
 939:	c7 05 08 0d 00 00 00 	movl   $0x0,0xd08
 940:	00 00 00 
 943:	e9 44 ff ff ff       	jmp    88c <malloc+0x2c>
 948:	90                   	nop
 949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 950:	8b 08                	mov    (%eax),%ecx
 952:	89 0a                	mov    %ecx,(%edx)
 954:	eb b1                	jmp    907 <malloc+0xa7>
