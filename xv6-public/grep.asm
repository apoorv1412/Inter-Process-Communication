
_grep:     file format elf32-i386


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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
  19:	83 ff 01             	cmp    $0x1,%edi
  1c:	7e 7c                	jle    9a <main+0x9a>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  1e:	8b 43 04             	mov    0x4(%ebx),%eax
  21:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  24:	83 ff 02             	cmp    $0x2,%edi
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  27:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  2c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  2f:	74 46                	je     77 <main+0x77>
  31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if((fd = open(argv[i], 0)) < 0){
  38:	83 ec 08             	sub    $0x8,%esp
  3b:	6a 00                	push   $0x0
  3d:	ff 33                	pushl  (%ebx)
  3f:	e8 57 06 00 00       	call   69b <open>
  44:	83 c4 10             	add    $0x10,%esp
  47:	85 c0                	test   %eax,%eax
  49:	78 3b                	js     86 <main+0x86>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(i = 2; i < argc; i++){
  51:	83 c6 01             	add    $0x1,%esi
    grep(pattern, fd);
  54:	50                   	push   %eax
  55:	ff 75 e0             	pushl  -0x20(%ebp)
  58:	83 c3 04             	add    $0x4,%ebx
  5b:	e8 d0 01 00 00       	call   230 <grep>
    close(fd);
  60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  63:	89 04 24             	mov    %eax,(%esp)
  66:	e8 18 06 00 00       	call   683 <close>
  for(i = 2; i < argc; i++){
  6b:	83 c4 10             	add    $0x10,%esp
  6e:	39 f7                	cmp    %esi,%edi
  70:	7f c6                	jg     38 <main+0x38>
  }
  exit();
  72:	e8 e4 05 00 00       	call   65b <exit>
    grep(pattern, 0);
  77:	52                   	push   %edx
  78:	52                   	push   %edx
  79:	6a 00                	push   $0x0
  7b:	50                   	push   %eax
  7c:	e8 af 01 00 00       	call   230 <grep>
    exit();
  81:	e8 d5 05 00 00       	call   65b <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  86:	50                   	push   %eax
  87:	ff 33                	pushl  (%ebx)
  89:	68 28 0b 00 00       	push   $0xb28
  8e:	6a 01                	push   $0x1
  90:	e8 1b 07 00 00       	call   7b0 <printf>
      exit();
  95:	e8 c1 05 00 00       	call   65b <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  9a:	51                   	push   %ecx
  9b:	51                   	push   %ecx
  9c:	68 08 0b 00 00       	push   $0xb08
  a1:	6a 02                	push   $0x2
  a3:	e8 08 07 00 00       	call   7b0 <printf>
    exit();
  a8:	e8 ae 05 00 00       	call   65b <exit>
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	83 ec 0c             	sub    $0xc,%esp
  b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  bf:	8b 7d 10             	mov    0x10(%ebp),%edi
  c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	57                   	push   %edi
  cc:	56                   	push   %esi
  cd:	e8 3e 00 00 00       	call   110 <matchhere>
  d2:	83 c4 10             	add    $0x10,%esp
  d5:	85 c0                	test   %eax,%eax
  d7:	75 1f                	jne    f8 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  d9:	0f be 17             	movsbl (%edi),%edx
  dc:	84 d2                	test   %dl,%dl
  de:	74 0c                	je     ec <matchstar+0x3c>
  e0:	83 c7 01             	add    $0x1,%edi
  e3:	39 da                	cmp    %ebx,%edx
  e5:	74 e1                	je     c8 <matchstar+0x18>
  e7:	83 fb 2e             	cmp    $0x2e,%ebx
  ea:	74 dc                	je     c8 <matchstar+0x18>
  return 0;
}
  ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ef:	5b                   	pop    %ebx
  f0:	5e                   	pop    %esi
  f1:	5f                   	pop    %edi
  f2:	5d                   	pop    %ebp
  f3:	c3                   	ret    
  f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
  fb:	b8 01 00 00 00       	mov    $0x1,%eax
}
 100:	5b                   	pop    %ebx
 101:	5e                   	pop    %esi
 102:	5f                   	pop    %edi
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <matchhere>:
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
 115:	53                   	push   %ebx
 116:	83 ec 0c             	sub    $0xc,%esp
  if(re[0] == '\0')
 119:	8b 45 08             	mov    0x8(%ebp),%eax
{
 11c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
 11f:	0f b6 08             	movzbl (%eax),%ecx
 122:	84 c9                	test   %cl,%cl
 124:	74 67                	je     18d <matchhere+0x7d>
  if(re[1] == '*')
 126:	0f be 40 01          	movsbl 0x1(%eax),%eax
 12a:	3c 2a                	cmp    $0x2a,%al
 12c:	74 6c                	je     19a <matchhere+0x8a>
  if(re[0] == '$' && re[1] == '\0')
 12e:	80 f9 24             	cmp    $0x24,%cl
 131:	0f b6 1f             	movzbl (%edi),%ebx
 134:	75 08                	jne    13e <matchhere+0x2e>
 136:	84 c0                	test   %al,%al
 138:	0f 84 81 00 00 00    	je     1bf <matchhere+0xaf>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 13e:	84 db                	test   %bl,%bl
 140:	74 09                	je     14b <matchhere+0x3b>
 142:	38 d9                	cmp    %bl,%cl
 144:	74 3c                	je     182 <matchhere+0x72>
 146:	80 f9 2e             	cmp    $0x2e,%cl
 149:	74 37                	je     182 <matchhere+0x72>
}
 14b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 14e:	31 c0                	xor    %eax,%eax
}
 150:	5b                   	pop    %ebx
 151:	5e                   	pop    %esi
 152:	5f                   	pop    %edi
 153:	5d                   	pop    %ebp
 154:	c3                   	ret    
 155:	8d 76 00             	lea    0x0(%esi),%esi
  if(re[1] == '*')
 158:	8b 75 08             	mov    0x8(%ebp),%esi
 15b:	0f b6 4e 01          	movzbl 0x1(%esi),%ecx
 15f:	80 f9 2a             	cmp    $0x2a,%cl
 162:	74 3b                	je     19f <matchhere+0x8f>
  if(re[0] == '$' && re[1] == '\0')
 164:	3c 24                	cmp    $0x24,%al
 166:	75 04                	jne    16c <matchhere+0x5c>
 168:	84 c9                	test   %cl,%cl
 16a:	74 4f                	je     1bb <matchhere+0xab>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 16c:	0f b6 33             	movzbl (%ebx),%esi
 16f:	89 f2                	mov    %esi,%edx
 171:	84 d2                	test   %dl,%dl
 173:	74 d6                	je     14b <matchhere+0x3b>
 175:	3c 2e                	cmp    $0x2e,%al
 177:	89 df                	mov    %ebx,%edi
 179:	74 04                	je     17f <matchhere+0x6f>
 17b:	38 c2                	cmp    %al,%dl
 17d:	75 cc                	jne    14b <matchhere+0x3b>
 17f:	0f be c1             	movsbl %cl,%eax
    return matchhere(re+1, text+1);
 182:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  if(re[0] == '\0')
 186:	84 c0                	test   %al,%al
    return matchhere(re+1, text+1);
 188:	8d 5f 01             	lea    0x1(%edi),%ebx
  if(re[0] == '\0')
 18b:	75 cb                	jne    158 <matchhere+0x48>
    return 1;
 18d:	b8 01 00 00 00       	mov    $0x1,%eax
}
 192:	8d 65 f4             	lea    -0xc(%ebp),%esp
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
  if(re[1] == '*')
 19a:	89 fb                	mov    %edi,%ebx
 19c:	0f be c1             	movsbl %cl,%eax
    return matchstar(re[0], re+2, text);
 19f:	8b 7d 08             	mov    0x8(%ebp),%edi
 1a2:	83 ec 04             	sub    $0x4,%esp
 1a5:	53                   	push   %ebx
 1a6:	8d 57 02             	lea    0x2(%edi),%edx
 1a9:	52                   	push   %edx
 1aa:	50                   	push   %eax
 1ab:	e8 00 ff ff ff       	call   b0 <matchstar>
 1b0:	83 c4 10             	add    $0x10,%esp
}
 1b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b6:	5b                   	pop    %ebx
 1b7:	5e                   	pop    %esi
 1b8:	5f                   	pop    %edi
 1b9:	5d                   	pop    %ebp
 1ba:	c3                   	ret    
 1bb:	0f b6 5f 01          	movzbl 0x1(%edi),%ebx
    return *text == '\0';
 1bf:	31 c0                	xor    %eax,%eax
 1c1:	84 db                	test   %bl,%bl
 1c3:	0f 94 c0             	sete   %al
 1c6:	eb ca                	jmp    192 <matchhere+0x82>
 1c8:	90                   	nop
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <match>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	8b 75 08             	mov    0x8(%ebp),%esi
 1d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 1db:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1de:	75 11                	jne    1f1 <match+0x21>
 1e0:	eb 2e                	jmp    210 <match+0x40>
 1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1e8:	83 c3 01             	add    $0x1,%ebx
 1eb:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 1ef:	74 16                	je     207 <match+0x37>
    if(matchhere(re, text))
 1f1:	83 ec 08             	sub    $0x8,%esp
 1f4:	53                   	push   %ebx
 1f5:	56                   	push   %esi
 1f6:	e8 15 ff ff ff       	call   110 <matchhere>
 1fb:	83 c4 10             	add    $0x10,%esp
 1fe:	85 c0                	test   %eax,%eax
 200:	74 e6                	je     1e8 <match+0x18>
      return 1;
 202:	b8 01 00 00 00       	mov    $0x1,%eax
}
 207:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20a:	5b                   	pop    %ebx
 20b:	5e                   	pop    %esi
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    
 20e:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 210:	83 c6 01             	add    $0x1,%esi
 213:	89 75 08             	mov    %esi,0x8(%ebp)
}
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 21c:	e9 ef fe ff ff       	jmp    110 <matchhere>
 221:	eb 0d                	jmp    230 <grep>
 223:	90                   	nop
 224:	90                   	nop
 225:	90                   	nop
 226:	90                   	nop
 227:	90                   	nop
 228:	90                   	nop
 229:	90                   	nop
 22a:	90                   	nop
 22b:	90                   	nop
 22c:	90                   	nop
 22d:	90                   	nop
 22e:	90                   	nop
 22f:	90                   	nop

00000230 <grep>:
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
  m = 0;
 236:	31 f6                	xor    %esi,%esi
{
 238:	83 ec 1c             	sub    $0x1c,%esp
 23b:	90                   	nop
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 240:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 245:	83 ec 04             	sub    $0x4,%esp
 248:	29 f0                	sub    %esi,%eax
 24a:	50                   	push   %eax
 24b:	8d 86 80 0f 00 00    	lea    0xf80(%esi),%eax
 251:	50                   	push   %eax
 252:	ff 75 0c             	pushl  0xc(%ebp)
 255:	e8 19 04 00 00       	call   673 <read>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	85 c0                	test   %eax,%eax
 25f:	0f 8e bb 00 00 00    	jle    320 <grep+0xf0>
    m += n;
 265:	01 c6                	add    %eax,%esi
    p = buf;
 267:	bb 80 0f 00 00       	mov    $0xf80,%ebx
    buf[m] = '\0';
 26c:	c6 86 80 0f 00 00 00 	movb   $0x0,0xf80(%esi)
 273:	89 75 e4             	mov    %esi,-0x1c(%ebp)
 276:	8d 76 00             	lea    0x0(%esi),%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    while((q = strchr(p, '\n')) != 0){
 280:	83 ec 08             	sub    $0x8,%esp
 283:	6a 0a                	push   $0xa
 285:	53                   	push   %ebx
 286:	e8 75 01 00 00       	call   400 <strchr>
 28b:	83 c4 10             	add    $0x10,%esp
 28e:	85 c0                	test   %eax,%eax
 290:	89 c6                	mov    %eax,%esi
 292:	74 44                	je     2d8 <grep+0xa8>
      if(match(pattern, p)){
 294:	83 ec 08             	sub    $0x8,%esp
      *q = 0;
 297:	c6 06 00             	movb   $0x0,(%esi)
 29a:	8d 7e 01             	lea    0x1(%esi),%edi
      if(match(pattern, p)){
 29d:	53                   	push   %ebx
 29e:	ff 75 08             	pushl  0x8(%ebp)
 2a1:	e8 2a ff ff ff       	call   1d0 <match>
 2a6:	83 c4 10             	add    $0x10,%esp
 2a9:	85 c0                	test   %eax,%eax
 2ab:	75 0b                	jne    2b8 <grep+0x88>
      p = q+1;
 2ad:	89 fb                	mov    %edi,%ebx
 2af:	eb cf                	jmp    280 <grep+0x50>
 2b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        write(1, p, q+1 - p);
 2b8:	89 f8                	mov    %edi,%eax
 2ba:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2bd:	c6 06 0a             	movb   $0xa,(%esi)
        write(1, p, q+1 - p);
 2c0:	29 d8                	sub    %ebx,%eax
 2c2:	50                   	push   %eax
 2c3:	53                   	push   %ebx
      p = q+1;
 2c4:	89 fb                	mov    %edi,%ebx
        write(1, p, q+1 - p);
 2c6:	6a 01                	push   $0x1
 2c8:	e8 ae 03 00 00       	call   67b <write>
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	eb ae                	jmp    280 <grep+0x50>
 2d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p == buf)
 2d8:	81 fb 80 0f 00 00    	cmp    $0xf80,%ebx
 2de:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 2e1:	74 2d                	je     310 <grep+0xe0>
    if(m > 0){
 2e3:	85 f6                	test   %esi,%esi
 2e5:	0f 8e 55 ff ff ff    	jle    240 <grep+0x10>
      m -= p - buf;
 2eb:	89 d8                	mov    %ebx,%eax
      memmove(buf, p, m);
 2ed:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2f0:	2d 80 0f 00 00       	sub    $0xf80,%eax
 2f5:	29 c6                	sub    %eax,%esi
      memmove(buf, p, m);
 2f7:	56                   	push   %esi
 2f8:	53                   	push   %ebx
 2f9:	68 80 0f 00 00       	push   $0xf80
 2fe:	e8 4d 02 00 00       	call   550 <memmove>
 303:	83 c4 10             	add    $0x10,%esp
 306:	e9 35 ff ff ff       	jmp    240 <grep+0x10>
 30b:	90                   	nop
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m = 0;
 310:	31 f6                	xor    %esi,%esi
 312:	e9 29 ff ff ff       	jmp    240 <grep+0x10>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}
 320:	8d 65 f4             	lea    -0xc(%ebp),%esp
 323:	5b                   	pop    %ebx
 324:	5e                   	pop    %esi
 325:	5f                   	pop    %edi
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    
 328:	66 90                	xchg   %ax,%ax
 32a:	66 90                	xchg   %ax,%ax
 32c:	66 90                	xchg   %ax,%ax
 32e:	66 90                	xchg   %ax,%ax

00000330 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 33a:	89 c2                	mov    %eax,%edx
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 340:	83 c1 01             	add    $0x1,%ecx
 343:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 347:	83 c2 01             	add    $0x1,%edx
 34a:	84 db                	test   %bl,%bl
 34c:	88 5a ff             	mov    %bl,-0x1(%edx)
 34f:	75 ef                	jne    340 <strcpy+0x10>
    ;
  return os;
}
 351:	5b                   	pop    %ebx
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    
 354:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 35a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000360 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
 367:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 36a:	0f b6 02             	movzbl (%edx),%eax
 36d:	0f b6 19             	movzbl (%ecx),%ebx
 370:	84 c0                	test   %al,%al
 372:	75 1c                	jne    390 <strcmp+0x30>
 374:	eb 2a                	jmp    3a0 <strcmp+0x40>
 376:	8d 76 00             	lea    0x0(%esi),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 380:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 383:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 386:	83 c1 01             	add    $0x1,%ecx
 389:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 38c:	84 c0                	test   %al,%al
 38e:	74 10                	je     3a0 <strcmp+0x40>
 390:	38 d8                	cmp    %bl,%al
 392:	74 ec                	je     380 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 394:	29 d8                	sub    %ebx,%eax
}
 396:	5b                   	pop    %ebx
 397:	5d                   	pop    %ebp
 398:	c3                   	ret    
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3a2:	29 d8                	sub    %ebx,%eax
}
 3a4:	5b                   	pop    %ebx
 3a5:	5d                   	pop    %ebp
 3a6:	c3                   	ret    
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <strlen>:

uint
strlen(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3b6:	80 39 00             	cmpb   $0x0,(%ecx)
 3b9:	74 15                	je     3d0 <strlen+0x20>
 3bb:	31 d2                	xor    %edx,%edx
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	75 f5                	jne    3c0 <strlen+0x10>
    ;
  return n;
}
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 3d0:	31 c0                	xor    %eax,%eax
}
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
 3d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ed:	89 d7                	mov    %edx,%edi
 3ef:	fc                   	cld    
 3f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3f2:	89 d0                	mov    %edx,%eax
 3f4:	5f                   	pop    %edi
 3f5:	5d                   	pop    %ebp
 3f6:	c3                   	ret    
 3f7:	89 f6                	mov    %esi,%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000400 <strchr>:

char*
strchr(const char *s, char c)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	53                   	push   %ebx
 404:	8b 45 08             	mov    0x8(%ebp),%eax
 407:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 40a:	0f b6 10             	movzbl (%eax),%edx
 40d:	84 d2                	test   %dl,%dl
 40f:	74 1d                	je     42e <strchr+0x2e>
    if(*s == c)
 411:	38 d3                	cmp    %dl,%bl
 413:	89 d9                	mov    %ebx,%ecx
 415:	75 0d                	jne    424 <strchr+0x24>
 417:	eb 17                	jmp    430 <strchr+0x30>
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 420:	38 ca                	cmp    %cl,%dl
 422:	74 0c                	je     430 <strchr+0x30>
  for(; *s; s++)
 424:	83 c0 01             	add    $0x1,%eax
 427:	0f b6 10             	movzbl (%eax),%edx
 42a:	84 d2                	test   %dl,%dl
 42c:	75 f2                	jne    420 <strchr+0x20>
      return (char*)s;
  return 0;
 42e:	31 c0                	xor    %eax,%eax
}
 430:	5b                   	pop    %ebx
 431:	5d                   	pop    %ebp
 432:	c3                   	ret    
 433:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <gets>:

char*
gets(char *buf, int max)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 446:	31 f6                	xor    %esi,%esi
 448:	89 f3                	mov    %esi,%ebx
{
 44a:	83 ec 1c             	sub    $0x1c,%esp
 44d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 450:	eb 2f                	jmp    481 <gets+0x41>
 452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 458:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45b:	83 ec 04             	sub    $0x4,%esp
 45e:	6a 01                	push   $0x1
 460:	50                   	push   %eax
 461:	6a 00                	push   $0x0
 463:	e8 0b 02 00 00       	call   673 <read>
    if(cc < 1)
 468:	83 c4 10             	add    $0x10,%esp
 46b:	85 c0                	test   %eax,%eax
 46d:	7e 1c                	jle    48b <gets+0x4b>
      break;
    buf[i++] = c;
 46f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 473:	83 c7 01             	add    $0x1,%edi
 476:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 479:	3c 0a                	cmp    $0xa,%al
 47b:	74 23                	je     4a0 <gets+0x60>
 47d:	3c 0d                	cmp    $0xd,%al
 47f:	74 1f                	je     4a0 <gets+0x60>
  for(i=0; i+1 < max; ){
 481:	83 c3 01             	add    $0x1,%ebx
 484:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 487:	89 fe                	mov    %edi,%esi
 489:	7c cd                	jl     458 <gets+0x18>
 48b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 48d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 490:	c6 03 00             	movb   $0x0,(%ebx)
}
 493:	8d 65 f4             	lea    -0xc(%ebp),%esp
 496:	5b                   	pop    %ebx
 497:	5e                   	pop    %esi
 498:	5f                   	pop    %edi
 499:	5d                   	pop    %ebp
 49a:	c3                   	ret    
 49b:	90                   	nop
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4a0:	8b 75 08             	mov    0x8(%ebp),%esi
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
 4a6:	01 de                	add    %ebx,%esi
 4a8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4aa:	c6 03 00             	movb   $0x0,(%ebx)
}
 4ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b0:	5b                   	pop    %ebx
 4b1:	5e                   	pop    %esi
 4b2:	5f                   	pop    %edi
 4b3:	5d                   	pop    %ebp
 4b4:	c3                   	ret    
 4b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	56                   	push   %esi
 4c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c5:	83 ec 08             	sub    $0x8,%esp
 4c8:	6a 00                	push   $0x0
 4ca:	ff 75 08             	pushl  0x8(%ebp)
 4cd:	e8 c9 01 00 00       	call   69b <open>
  if(fd < 0)
 4d2:	83 c4 10             	add    $0x10,%esp
 4d5:	85 c0                	test   %eax,%eax
 4d7:	78 27                	js     500 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4d9:	83 ec 08             	sub    $0x8,%esp
 4dc:	ff 75 0c             	pushl  0xc(%ebp)
 4df:	89 c3                	mov    %eax,%ebx
 4e1:	50                   	push   %eax
 4e2:	e8 cc 01 00 00       	call   6b3 <fstat>
  close(fd);
 4e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ea:	89 c6                	mov    %eax,%esi
  close(fd);
 4ec:	e8 92 01 00 00       	call   683 <close>
  return r;
 4f1:	83 c4 10             	add    $0x10,%esp
}
 4f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4f7:	89 f0                	mov    %esi,%eax
 4f9:	5b                   	pop    %ebx
 4fa:	5e                   	pop    %esi
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 500:	be ff ff ff ff       	mov    $0xffffffff,%esi
 505:	eb ed                	jmp    4f4 <stat+0x34>
 507:	89 f6                	mov    %esi,%esi
 509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000510 <atoi>:

int
atoi(const char *s)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	53                   	push   %ebx
 514:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 517:	0f be 11             	movsbl (%ecx),%edx
 51a:	8d 42 d0             	lea    -0x30(%edx),%eax
 51d:	3c 09                	cmp    $0x9,%al
  n = 0;
 51f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 524:	77 1f                	ja     545 <atoi+0x35>
 526:	8d 76 00             	lea    0x0(%esi),%esi
 529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 530:	8d 04 80             	lea    (%eax,%eax,4),%eax
 533:	83 c1 01             	add    $0x1,%ecx
 536:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 53a:	0f be 11             	movsbl (%ecx),%edx
 53d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 540:	80 fb 09             	cmp    $0x9,%bl
 543:	76 eb                	jbe    530 <atoi+0x20>
  return n;
}
 545:	5b                   	pop    %ebx
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
 548:	90                   	nop
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000550 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	56                   	push   %esi
 554:	53                   	push   %ebx
 555:	8b 5d 10             	mov    0x10(%ebp),%ebx
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 55e:	85 db                	test   %ebx,%ebx
 560:	7e 14                	jle    576 <memmove+0x26>
 562:	31 d2                	xor    %edx,%edx
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 568:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 56c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 56f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 572:	39 d3                	cmp    %edx,%ebx
 574:	75 f2                	jne    568 <memmove+0x18>
  return vdst;
}
 576:	5b                   	pop    %ebx
 577:	5e                   	pop    %esi
 578:	5d                   	pop    %ebp
 579:	c3                   	ret    
 57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000580 <writeBuffer>:

int writeBuffer(char* buff, char* va)
{
 580:	55                   	push   %ebp
  int x = 0;
 581:	31 c9                	xor    %ecx,%ecx
{
 583:	89 e5                	mov    %esp,%ebp
 585:	56                   	push   %esi
 586:	53                   	push   %ebx
 587:	8b 75 0c             	mov    0xc(%ebp),%esi
 58a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char* temp = va;
  while (*buff != '.')
 58d:	89 f0                	mov    %esi,%eax
 58f:	0f b6 13             	movzbl (%ebx),%edx
 592:	eb 09                	jmp    59d <writeBuffer+0x1d>
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  {
    if (*va == 'A')
 598:	80 38 41             	cmpb   $0x41,(%eax)
 59b:	74 13                	je     5b0 <writeBuffer+0x30>
  while (*buff != '.')
 59d:	80 fa 2e             	cmp    $0x2e,%dl
 5a0:	75 f6                	jne    598 <writeBuffer+0x18>
        va = temp;
      else
        va++;
    }
  }
  *va = '.';
 5a2:	c6 00 2e             	movb   $0x2e,(%eax)
  return 1;
}
 5a5:	b8 01 00 00 00       	mov    $0x1,%eax
 5aa:	5b                   	pop    %ebx
 5ab:	5e                   	pop    %esi
 5ac:	5d                   	pop    %ebp
 5ad:	c3                   	ret    
 5ae:	66 90                	xchg   %ax,%ax
      x = (x + 1)%4096;
 5b0:	83 c1 01             	add    $0x1,%ecx
      *va = *buff;
 5b3:	88 10                	mov    %dl,(%eax)
      buff++;
 5b5:	83 c3 01             	add    $0x1,%ebx
        va++;
 5b8:	83 c0 01             	add    $0x1,%eax
 5bb:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
 5c1:	0f 44 c6             	cmove  %esi,%eax
 5c4:	eb c9                	jmp    58f <writeBuffer+0xf>
 5c6:	8d 76 00             	lea    0x0(%esi),%esi
 5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005d0 <readBuffer>:

int readBuffer(char* va)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
  int c = 0, x = 0;
 5d6:	31 f6                	xor    %esi,%esi
 5d8:	31 db                	xor    %ebx,%ebx
{
 5da:	83 ec 0c             	sub    $0xc,%esp
  char* temp = va;
  while (*va != '.')
 5dd:	8b 7d 08             	mov    0x8(%ebp),%edi
 5e0:	0f be 07             	movsbl (%edi),%eax
 5e3:	3c 2e                	cmp    $0x2e,%al
 5e5:	74 40                	je     627 <readBuffer+0x57>
 5e7:	89 f6                	mov    %esi,%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  {
    if (*va != 'A')
 5f0:	3c 41                	cmp    $0x41,%al
 5f2:	74 fc                	je     5f0 <readBuffer+0x20>
    {
      printf(1,"%c", *va);
 5f4:	83 ec 04             	sub    $0x4,%esp
      x = (x+1)%4096;
      c++; 
      if (x == 0)
        va = temp;
      else
        va++;
 5f7:	83 c7 01             	add    $0x1,%edi
      c++; 
 5fa:	83 c3 01             	add    $0x1,%ebx
      printf(1,"%c", *va);
 5fd:	50                   	push   %eax
 5fe:	68 3e 0b 00 00       	push   $0xb3e
 603:	6a 01                	push   $0x1
 605:	e8 a6 01 00 00       	call   7b0 <printf>
      x = (x+1)%4096;
 60a:	8d 56 01             	lea    0x1(%esi),%edx
      *va = 'A';
 60d:	c6 47 ff 41          	movb   $0x41,-0x1(%edi)
      if (x == 0)
 611:	83 c4 10             	add    $0x10,%esp
        va++;
 614:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 61a:	0f 44 7d 08          	cmove  0x8(%ebp),%edi
 61e:	89 d6                	mov    %edx,%esi
  while (*va != '.')
 620:	0f be 07             	movsbl (%edi),%eax
 623:	3c 2e                	cmp    $0x2e,%al
 625:	75 c9                	jne    5f0 <readBuffer+0x20>
    }
  }
  printf(1,"\n");
 627:	83 ec 08             	sub    $0x8,%esp
 62a:	68 3c 0b 00 00       	push   $0xb3c
 62f:	6a 01                	push   $0x1
 631:	e8 7a 01 00 00       	call   7b0 <printf>
  printf(1,"The value of the counter is %d\n", c);
 636:	83 c4 0c             	add    $0xc,%esp
 639:	53                   	push   %ebx
 63a:	68 44 0b 00 00       	push   $0xb44
 63f:	6a 01                	push   $0x1
 641:	e8 6a 01 00 00       	call   7b0 <printf>
  return 1;
 646:	8d 65 f4             	lea    -0xc(%ebp),%esp
 649:	b8 01 00 00 00       	mov    $0x1,%eax
 64e:	5b                   	pop    %ebx
 64f:	5e                   	pop    %esi
 650:	5f                   	pop    %edi
 651:	5d                   	pop    %ebp
 652:	c3                   	ret    

00000653 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 653:	b8 01 00 00 00       	mov    $0x1,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <exit>:
SYSCALL(exit)
 65b:	b8 02 00 00 00       	mov    $0x2,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <wait>:
SYSCALL(wait)
 663:	b8 03 00 00 00       	mov    $0x3,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <pipe>:
SYSCALL(pipe)
 66b:	b8 04 00 00 00       	mov    $0x4,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <read>:
SYSCALL(read)
 673:	b8 05 00 00 00       	mov    $0x5,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <write>:
SYSCALL(write)
 67b:	b8 10 00 00 00       	mov    $0x10,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <close>:
SYSCALL(close)
 683:	b8 15 00 00 00       	mov    $0x15,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <kill>:
SYSCALL(kill)
 68b:	b8 06 00 00 00       	mov    $0x6,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <exec>:
SYSCALL(exec)
 693:	b8 07 00 00 00       	mov    $0x7,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <open>:
SYSCALL(open)
 69b:	b8 0f 00 00 00       	mov    $0xf,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <mknod>:
SYSCALL(mknod)
 6a3:	b8 11 00 00 00       	mov    $0x11,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <unlink>:
SYSCALL(unlink)
 6ab:	b8 12 00 00 00       	mov    $0x12,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <fstat>:
SYSCALL(fstat)
 6b3:	b8 08 00 00 00       	mov    $0x8,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <link>:
SYSCALL(link)
 6bb:	b8 13 00 00 00       	mov    $0x13,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <mkdir>:
SYSCALL(mkdir)
 6c3:	b8 14 00 00 00       	mov    $0x14,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <chdir>:
SYSCALL(chdir)
 6cb:	b8 09 00 00 00       	mov    $0x9,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <dup>:
SYSCALL(dup)
 6d3:	b8 0a 00 00 00       	mov    $0xa,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <getpid>:
SYSCALL(getpid)
 6db:	b8 0b 00 00 00       	mov    $0xb,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <sbrk>:
SYSCALL(sbrk)
 6e3:	b8 0c 00 00 00       	mov    $0xc,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <sleep>:
SYSCALL(sleep)
 6eb:	b8 0d 00 00 00       	mov    $0xd,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <uptime>:
SYSCALL(uptime)
 6f3:	b8 0e 00 00 00       	mov    $0xe,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <attachpage>:
SYSCALL(attachpage)
 6fb:	b8 16 00 00 00       	mov    $0x16,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    
 703:	66 90                	xchg   %ax,%ax
 705:	66 90                	xchg   %ax,%ax
 707:	66 90                	xchg   %ax,%ax
 709:	66 90                	xchg   %ax,%ax
 70b:	66 90                	xchg   %ax,%ax
 70d:	66 90                	xchg   %ax,%ax
 70f:	90                   	nop

00000710 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 719:	85 d2                	test   %edx,%edx
{
 71b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 71e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 720:	79 76                	jns    798 <printint+0x88>
 722:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 726:	74 70                	je     798 <printint+0x88>
    x = -xx;
 728:	f7 d8                	neg    %eax
    neg = 1;
 72a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 731:	31 f6                	xor    %esi,%esi
 733:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 736:	eb 0a                	jmp    742 <printint+0x32>
 738:	90                   	nop
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 740:	89 fe                	mov    %edi,%esi
 742:	31 d2                	xor    %edx,%edx
 744:	8d 7e 01             	lea    0x1(%esi),%edi
 747:	f7 f1                	div    %ecx
 749:	0f b6 92 6c 0b 00 00 	movzbl 0xb6c(%edx),%edx
  }while((x /= base) != 0);
 750:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 752:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 755:	75 e9                	jne    740 <printint+0x30>
  if(neg)
 757:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 75a:	85 c0                	test   %eax,%eax
 75c:	74 08                	je     766 <printint+0x56>
    buf[i++] = '-';
 75e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 763:	8d 7e 02             	lea    0x2(%esi),%edi
 766:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 76a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 76d:	8d 76 00             	lea    0x0(%esi),%esi
 770:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 773:	83 ec 04             	sub    $0x4,%esp
 776:	83 ee 01             	sub    $0x1,%esi
 779:	6a 01                	push   $0x1
 77b:	53                   	push   %ebx
 77c:	57                   	push   %edi
 77d:	88 45 d7             	mov    %al,-0x29(%ebp)
 780:	e8 f6 fe ff ff       	call   67b <write>

  while(--i >= 0)
 785:	83 c4 10             	add    $0x10,%esp
 788:	39 de                	cmp    %ebx,%esi
 78a:	75 e4                	jne    770 <printint+0x60>
    putc(fd, buf[i]);
}
 78c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78f:	5b                   	pop    %ebx
 790:	5e                   	pop    %esi
 791:	5f                   	pop    %edi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret    
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 798:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 79f:	eb 90                	jmp    731 <printint+0x21>
 7a1:	eb 0d                	jmp    7b0 <printf>
 7a3:	90                   	nop
 7a4:	90                   	nop
 7a5:	90                   	nop
 7a6:	90                   	nop
 7a7:	90                   	nop
 7a8:	90                   	nop
 7a9:	90                   	nop
 7aa:	90                   	nop
 7ab:	90                   	nop
 7ac:	90                   	nop
 7ad:	90                   	nop
 7ae:	90                   	nop
 7af:	90                   	nop

000007b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7b9:	8b 75 0c             	mov    0xc(%ebp),%esi
 7bc:	0f b6 1e             	movzbl (%esi),%ebx
 7bf:	84 db                	test   %bl,%bl
 7c1:	0f 84 b3 00 00 00    	je     87a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 7c7:	8d 45 10             	lea    0x10(%ebp),%eax
 7ca:	83 c6 01             	add    $0x1,%esi
  state = 0;
 7cd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 7cf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 7d2:	eb 2f                	jmp    803 <printf+0x53>
 7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7d8:	83 f8 25             	cmp    $0x25,%eax
 7db:	0f 84 a7 00 00 00    	je     888 <printf+0xd8>
  write(fd, &c, 1);
 7e1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 7e4:	83 ec 04             	sub    $0x4,%esp
 7e7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 7ea:	6a 01                	push   $0x1
 7ec:	50                   	push   %eax
 7ed:	ff 75 08             	pushl  0x8(%ebp)
 7f0:	e8 86 fe ff ff       	call   67b <write>
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 7fb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 7ff:	84 db                	test   %bl,%bl
 801:	74 77                	je     87a <printf+0xca>
    if(state == 0){
 803:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 805:	0f be cb             	movsbl %bl,%ecx
 808:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 80b:	74 cb                	je     7d8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 80d:	83 ff 25             	cmp    $0x25,%edi
 810:	75 e6                	jne    7f8 <printf+0x48>
      if(c == 'd'){
 812:	83 f8 64             	cmp    $0x64,%eax
 815:	0f 84 05 01 00 00    	je     920 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 81b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 821:	83 f9 70             	cmp    $0x70,%ecx
 824:	74 72                	je     898 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 826:	83 f8 73             	cmp    $0x73,%eax
 829:	0f 84 99 00 00 00    	je     8c8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 82f:	83 f8 63             	cmp    $0x63,%eax
 832:	0f 84 08 01 00 00    	je     940 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 838:	83 f8 25             	cmp    $0x25,%eax
 83b:	0f 84 ef 00 00 00    	je     930 <printf+0x180>
  write(fd, &c, 1);
 841:	8d 45 e7             	lea    -0x19(%ebp),%eax
 844:	83 ec 04             	sub    $0x4,%esp
 847:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 84b:	6a 01                	push   $0x1
 84d:	50                   	push   %eax
 84e:	ff 75 08             	pushl  0x8(%ebp)
 851:	e8 25 fe ff ff       	call   67b <write>
 856:	83 c4 0c             	add    $0xc,%esp
 859:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 85c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 85f:	6a 01                	push   $0x1
 861:	50                   	push   %eax
 862:	ff 75 08             	pushl  0x8(%ebp)
 865:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 868:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 86a:	e8 0c fe ff ff       	call   67b <write>
  for(i = 0; fmt[i]; i++){
 86f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 873:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 876:	84 db                	test   %bl,%bl
 878:	75 89                	jne    803 <printf+0x53>
    }
  }
}
 87a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 87d:	5b                   	pop    %ebx
 87e:	5e                   	pop    %esi
 87f:	5f                   	pop    %edi
 880:	5d                   	pop    %ebp
 881:	c3                   	ret    
 882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 888:	bf 25 00 00 00       	mov    $0x25,%edi
 88d:	e9 66 ff ff ff       	jmp    7f8 <printf+0x48>
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 898:	83 ec 0c             	sub    $0xc,%esp
 89b:	b9 10 00 00 00       	mov    $0x10,%ecx
 8a0:	6a 00                	push   $0x0
 8a2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 8a5:	8b 45 08             	mov    0x8(%ebp),%eax
 8a8:	8b 17                	mov    (%edi),%edx
 8aa:	e8 61 fe ff ff       	call   710 <printint>
        ap++;
 8af:	89 f8                	mov    %edi,%eax
 8b1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8b4:	31 ff                	xor    %edi,%edi
        ap++;
 8b6:	83 c0 04             	add    $0x4,%eax
 8b9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 8bc:	e9 37 ff ff ff       	jmp    7f8 <printf+0x48>
 8c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 8c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8cb:	8b 08                	mov    (%eax),%ecx
        ap++;
 8cd:	83 c0 04             	add    $0x4,%eax
 8d0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 8d3:	85 c9                	test   %ecx,%ecx
 8d5:	0f 84 8e 00 00 00    	je     969 <printf+0x1b9>
        while(*s != 0){
 8db:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 8de:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 8e0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 8e2:	84 c0                	test   %al,%al
 8e4:	0f 84 0e ff ff ff    	je     7f8 <printf+0x48>
 8ea:	89 75 d0             	mov    %esi,-0x30(%ebp)
 8ed:	89 de                	mov    %ebx,%esi
 8ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8f2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 8f5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8f8:	83 ec 04             	sub    $0x4,%esp
          s++;
 8fb:	83 c6 01             	add    $0x1,%esi
 8fe:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 901:	6a 01                	push   $0x1
 903:	57                   	push   %edi
 904:	53                   	push   %ebx
 905:	e8 71 fd ff ff       	call   67b <write>
        while(*s != 0){
 90a:	0f b6 06             	movzbl (%esi),%eax
 90d:	83 c4 10             	add    $0x10,%esp
 910:	84 c0                	test   %al,%al
 912:	75 e4                	jne    8f8 <printf+0x148>
 914:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 917:	31 ff                	xor    %edi,%edi
 919:	e9 da fe ff ff       	jmp    7f8 <printf+0x48>
 91e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 920:	83 ec 0c             	sub    $0xc,%esp
 923:	b9 0a 00 00 00       	mov    $0xa,%ecx
 928:	6a 01                	push   $0x1
 92a:	e9 73 ff ff ff       	jmp    8a2 <printf+0xf2>
 92f:	90                   	nop
  write(fd, &c, 1);
 930:	83 ec 04             	sub    $0x4,%esp
 933:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 936:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 939:	6a 01                	push   $0x1
 93b:	e9 21 ff ff ff       	jmp    861 <printf+0xb1>
        putc(fd, *ap);
 940:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 943:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 946:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 948:	6a 01                	push   $0x1
        ap++;
 94a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 94d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 950:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 953:	50                   	push   %eax
 954:	ff 75 08             	pushl  0x8(%ebp)
 957:	e8 1f fd ff ff       	call   67b <write>
        ap++;
 95c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 95f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 962:	31 ff                	xor    %edi,%edi
 964:	e9 8f fe ff ff       	jmp    7f8 <printf+0x48>
          s = "(null)";
 969:	bb 64 0b 00 00       	mov    $0xb64,%ebx
        while(*s != 0){
 96e:	b8 28 00 00 00       	mov    $0x28,%eax
 973:	e9 72 ff ff ff       	jmp    8ea <printf+0x13a>
 978:	66 90                	xchg   %ax,%ax
 97a:	66 90                	xchg   %ax,%ax
 97c:	66 90                	xchg   %ax,%ax
 97e:	66 90                	xchg   %ax,%ax

00000980 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 980:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 981:	a1 60 0f 00 00       	mov    0xf60,%eax
{
 986:	89 e5                	mov    %esp,%ebp
 988:	57                   	push   %edi
 989:	56                   	push   %esi
 98a:	53                   	push   %ebx
 98b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 98e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 998:	39 c8                	cmp    %ecx,%eax
 99a:	8b 10                	mov    (%eax),%edx
 99c:	73 32                	jae    9d0 <free+0x50>
 99e:	39 d1                	cmp    %edx,%ecx
 9a0:	72 04                	jb     9a6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a2:	39 d0                	cmp    %edx,%eax
 9a4:	72 32                	jb     9d8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9a6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9a9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ac:	39 fa                	cmp    %edi,%edx
 9ae:	74 30                	je     9e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9b0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9b3:	8b 50 04             	mov    0x4(%eax),%edx
 9b6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9b9:	39 f1                	cmp    %esi,%ecx
 9bb:	74 3a                	je     9f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9bd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9bf:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 9c4:	5b                   	pop    %ebx
 9c5:	5e                   	pop    %esi
 9c6:	5f                   	pop    %edi
 9c7:	5d                   	pop    %ebp
 9c8:	c3                   	ret    
 9c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d0:	39 d0                	cmp    %edx,%eax
 9d2:	72 04                	jb     9d8 <free+0x58>
 9d4:	39 d1                	cmp    %edx,%ecx
 9d6:	72 ce                	jb     9a6 <free+0x26>
{
 9d8:	89 d0                	mov    %edx,%eax
 9da:	eb bc                	jmp    998 <free+0x18>
 9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 9e0:	03 72 04             	add    0x4(%edx),%esi
 9e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9e6:	8b 10                	mov    (%eax),%edx
 9e8:	8b 12                	mov    (%edx),%edx
 9ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ed:	8b 50 04             	mov    0x4(%eax),%edx
 9f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9f3:	39 f1                	cmp    %esi,%ecx
 9f5:	75 c6                	jne    9bd <free+0x3d>
    p->s.size += bp->s.size;
 9f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 9fa:	a3 60 0f 00 00       	mov    %eax,0xf60
    p->s.size += bp->s.size;
 9ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a02:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a05:	89 10                	mov    %edx,(%eax)
}
 a07:	5b                   	pop    %ebx
 a08:	5e                   	pop    %esi
 a09:	5f                   	pop    %edi
 a0a:	5d                   	pop    %ebp
 a0b:	c3                   	ret    
 a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	57                   	push   %edi
 a14:	56                   	push   %esi
 a15:	53                   	push   %ebx
 a16:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a19:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a1c:	8b 15 60 0f 00 00    	mov    0xf60,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a22:	8d 78 07             	lea    0x7(%eax),%edi
 a25:	c1 ef 03             	shr    $0x3,%edi
 a28:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 a2b:	85 d2                	test   %edx,%edx
 a2d:	0f 84 9d 00 00 00    	je     ad0 <malloc+0xc0>
 a33:	8b 02                	mov    (%edx),%eax
 a35:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a38:	39 cf                	cmp    %ecx,%edi
 a3a:	76 6c                	jbe    aa8 <malloc+0x98>
 a3c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 a42:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a47:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 a4a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 a51:	eb 0e                	jmp    a61 <malloc+0x51>
 a53:	90                   	nop
 a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a58:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a5a:	8b 48 04             	mov    0x4(%eax),%ecx
 a5d:	39 f9                	cmp    %edi,%ecx
 a5f:	73 47                	jae    aa8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a61:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 a67:	89 c2                	mov    %eax,%edx
 a69:	75 ed                	jne    a58 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a6b:	83 ec 0c             	sub    $0xc,%esp
 a6e:	56                   	push   %esi
 a6f:	e8 6f fc ff ff       	call   6e3 <sbrk>
  if(p == (char*)-1)
 a74:	83 c4 10             	add    $0x10,%esp
 a77:	83 f8 ff             	cmp    $0xffffffff,%eax
 a7a:	74 1c                	je     a98 <malloc+0x88>
  hp->s.size = nu;
 a7c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a7f:	83 ec 0c             	sub    $0xc,%esp
 a82:	83 c0 08             	add    $0x8,%eax
 a85:	50                   	push   %eax
 a86:	e8 f5 fe ff ff       	call   980 <free>
  return freep;
 a8b:	8b 15 60 0f 00 00    	mov    0xf60,%edx
      if((p = morecore(nunits)) == 0)
 a91:	83 c4 10             	add    $0x10,%esp
 a94:	85 d2                	test   %edx,%edx
 a96:	75 c0                	jne    a58 <malloc+0x48>
        return 0;
  }
}
 a98:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a9b:	31 c0                	xor    %eax,%eax
}
 a9d:	5b                   	pop    %ebx
 a9e:	5e                   	pop    %esi
 a9f:	5f                   	pop    %edi
 aa0:	5d                   	pop    %ebp
 aa1:	c3                   	ret    
 aa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 aa8:	39 cf                	cmp    %ecx,%edi
 aaa:	74 54                	je     b00 <malloc+0xf0>
        p->s.size -= nunits;
 aac:	29 f9                	sub    %edi,%ecx
 aae:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ab1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 ab4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 ab7:	89 15 60 0f 00 00    	mov    %edx,0xf60
}
 abd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 ac0:	83 c0 08             	add    $0x8,%eax
}
 ac3:	5b                   	pop    %ebx
 ac4:	5e                   	pop    %esi
 ac5:	5f                   	pop    %edi
 ac6:	5d                   	pop    %ebp
 ac7:	c3                   	ret    
 ac8:	90                   	nop
 ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 ad0:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 ad7:	0f 00 00 
 ada:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 ae1:	0f 00 00 
    base.s.size = 0;
 ae4:	b8 64 0f 00 00       	mov    $0xf64,%eax
 ae9:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 af0:	00 00 00 
 af3:	e9 44 ff ff ff       	jmp    a3c <malloc+0x2c>
 af8:	90                   	nop
 af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 b00:	8b 08                	mov    (%eax),%ecx
 b02:	89 0a                	mov    %ecx,(%edx)
 b04:	eb b1                	jmp    ab7 <malloc+0xa7>
