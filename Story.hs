module Story
    (
    beginning,
    sword,
    wand,
    bow,
    printChoice,
    endGameDeath,
    endGameCongrats,
    printChoiceBattle,
    ramsorDialogue,
    mynxeDialogue,
    anmiDialogue,
    ghaaaauyaDialogue,
    lohnDialogue,
    mountainWolfDialogue,
    malfoyDialogue,
    robinhoODoFilmeDialogue,
    singleEyedGladiatorDialogue,
    itzelDialogue,
    hydellDialogue,
    durgessDialogue,
    terakDialogue,
    ilyDialogue,
    noxDialogue,
    kingForgusGhostDialogue
    ) where

-- Beginning of the story dialogue
beginning = putStrLn "Voce acorda em uma casa vazia. 'O que esta acontecendo?'\
\ Voce se pergunta. Ainda atordoado por algum motivo, resolve estudar melhor\
\ o ambiente. Imediamente, nota uma mesa a sua frente com tres itens.\
\ Um graveto - nao. Seus olhos voltam ao normal - uma varinha a\
\ esquerda. Uma espada no centro. E um arco e uma aljava com algumas\
\ flechas a direita. \n\n\
\ Ao redor, apenas paredes brancas e uma porta. Voce esta confuso.\
\ E melhor tentar sair para descobrir por que você esta aqui. Voce decide pegar\
\ um dos equipamentos da mesa e explorar. \n\n\
\ O que voce quer pegar?"

-- Weapon choices dialogue
sword = "Voce pega a espada"
wand = "Voce pega a varinha"
bow = "Voce pega o arco e a aljava"

-- Prints weapon choice and dialogue
printChoice xs = putStrLn $ xs ++ "imeadiatamente um flashback passa por\
\ sua mente. Imagens confusas. Uma nave. Um virus. Tripulacao.\
\ A Terra. Um nome: Talinia. Voce resolve sair e tentar entender o que tudo\
\ isso significa."

-- Bad ending dialogue
endGameDeath = "Voce foi derrotado! A sua mente sucumbe no vazio e o fim chegou."

-- Good ending dialogue
endGameCongrats = "Inesperadamente, voce cai e tudo fica preto. Voce nao acredita - acabara \
\de ganhar mais uma batalha. De repente, houve alguem chamar seu nome.\
\Finalmente, consegue abrir seus olhos. A primeira coisa que vê: um rosto.\
\É Talinia. Ela chora e sorri. Voce ouve barulhos de computadores. Uma janela\
\enorme a esquerda. A Lua. A Terra. Voce lembra. Voce acabara de salvar a\
\tripulacao, sua missao. \n\n Parabens!"

-- Prints enemy dialogue and battle choices
printChoiceBattle = putStrLn $ "\n\nVoce decide: \n1 - Atacar\n2 - Curar-se"

-- Enemies dialogues
ramsorDialogue = "Voce encontra o grande guerreiro Ramsor.\n\n\
\             ++=+                  \n\
\            ==:?:=~,I=~~=?=           \n\
\            =~   I=~=:  ,~:=            \n\
\            ~~   ~:        ,~~+         \n\
\            ?~==~~~,       7:=          \n\
\           +======~~:~~,                \n\
\        :=~:~==~=~=.~~~~~~~~=           \n\
\      ,+==~:~======:,=~~~~~~~~:         \n\
\     ,====:==:::~====~~~~~~~~~~~I       \n\
\     +~===,==?=======~~~~===~~~~~,      \n\
\    ~==~===.==:=====~~~~~===~~~~~~,     \n\
\    ?==~+===~.~~~~~~~~~~~,+==~~~~~~I    \n\
\   ?===~+=============~~~~:====~~~~:    \n\
\  ======,=====~~~=====~~~~:~====~~~~    \n\
\  .====~~,~~~====,~~~~~~:~~~I===~~~~    \n\
\II==,~~~~~==~===~=====~~~~~:I?~=~~~~:   \n\
\====..~~  .==========~~~,+II=?===~~~~,  \n\
\I~==~~..  ,I+II777,~?I7777~,.====~~~~~  \n\
\ =,:??:: ?=~,+7777=777777+~~~:===~~~~:  \n\
\    :~: .===:+7777I7777.====~.==~~~~~   \n\
\        ~===I+77777I  :=====~~,         \n\
\    ~,,:,,=~~,I77II.  =====~.,.?        \n\
\ ~==,,,=?=~~~~~:    II==~=+???=?,:,     \n\
\    ?=~~~~:~        ======:==~~,==~~    \n\
\                        ~,,,.=       \n\
\'Este local não foi feito para os vivos. E eu farei questao que voce nao esteja\
\ao fim desta batalha!''"

mynxeDialogue = "Mynxe, a maga de 100 anos aparece diante de voce!\n\n\
\             7II   :                    \n\
\            ??.IIII.:,???III            \n\
\       I I?I??.,????~::?????I?7I        \n\
\  7  I7??IIII  :. 7I.::,IIIIII???7      \n\
\  ?I?I?IIIII   ~:.   :::    7II???7     \n\
\  IIIIIII:7=.  7::, ~~::.     III??     \n\
\   7III7.+  +I  .~~~~::::    I7II?I     \n\
\        .: =I   =~~~~:::::    I I??7    \n\
\         I,I7 ?~~~~==::,:,   7III?I7    \n\
\         +.I   =~~=,.,:,,, 7III??I      \n\
\   7     7 ~,7I~~:,:,,,,,,+I??II7       \n\
\  I7I I?????~  ~~,,,.~~,,:.I7           \n\
\  II???     :..~,I?,===..~~=            \n\
\  I??       :+=+..==~~:,~~.,?           \n\
\  I?        .====.~~:~~.~.,     .=+==   \n\
\  ??         .~~~~+++~~.,..I   +==,     \n\
\  I?I    ?    :I?++++=~,,.     +=~I     \n\
\   I?????      +.++++~...     .+=~      \n\
\  IIIIIII      ~I777.~~=+=   ,+==~      \n\
\    II          +IIII~~=+~======~~      \n\
\                .IIIII.==+=====~~.      \n\
\                ?IIII?+~==:~~~~~7       \n\
\               .=:++++.~:=+..7          \n\
\               ~~~~~+  ~=+++.           \n\
\                         ~~        \n\
\'AVADA KEDAVRA!' "

anmiDialogue = "Um novo oponente surge! \n\n\
\                  .I=?        :7II~7    \n\
\         +++?.?, 7 7 ..?.    77,.       \n\
\           =?=?.77777777I?  77II        \n\
\      7I7.=?77III7IIIII .7  7.I +       \n\
\     777:~~ 7I, 7I~IIII..:.I7:      .   \n\
\     II .II  7.~++~,III:.  :7I=+~,=I    \n\
\    II.7777I=IIIII ~II. I    ?7777I     \n\
\    =I~I    ?I  ,+?.+.   .              \n\
\     I .I,   7  ?  7III  I.             \n\
\      . I    7II7II.  III7              \n\
\        I     .777II7777,            \n\
\'Voce esta morto! "

ghaaaauyaDialogue = "Mais um oponente aparece! \n\n\
\          :                     I...    \n\
\        ~=                  ?,:~I,      \n\
\       :=7     ::===.    =~:IIIIIII,    \n\
\     ?~=.  ?=====~I    .:+??II::.+I.    \n\
\    ~~== .======I    ,~+??,:=IIII+      \n\
\    ~==:==========I.:+=~=????????III    \n\
\   :==============~.,.+++,,~,.:+?II.    \n\
\  7~===========::~~:+.~.+??????I,       \n\
\  :~=~=====~~~~=~~.:+++++???+~          \n\
\ ,:~=~~~~~~~~~~~====:..,++????I,        \n\
\ I~~~~~~~~~~~~~~~~~.   =~++?????I+      \n\
\  7,~,,     ~~~~~~~~7 =~++++?,I   .?    \n\
\       ?==, ,~~~,,.=  ~.?????I          \n\
\      ?+~~~=~~~~~~~, ~~+?II,~7          \n\
\      ++7+~~+??+7.~..~.+?~~~=~I         \n\
\      ?I=+~~??+=I.~~~~~~~~~==~~ ~,      \n\
\     I~:=~~~+?+==~~~~:~~~~~==~~:~~,     \n\
\       ,:~~~~~~~~:~:,=~~~.,.=~~.~~~.    \n\
\       ~=:~~~~~~:.~~,=====~ =~~~~=~~    \n\
\     ,=~~~:      ========~~ .==~.==,.   \n\
\  ,:==:~,      ~==~~I         I .~=~~   \n\
\ ::==~=~     7~==~=~?         ===.==~~I \n\
\ +  .~~I    ~=:I=~=~~        ~=~~=,~.=: \n\
\    .       ...               ~   ,? ?  \n\
\             I                       \n\
\ 'GHAAAAUYAAAAAAA!' "

lohnDialogue = "Lohn, o mago das trevas surge diante de voce! \n\n\
\      .+      .+==+.                    \n\
\  .+..=++    :~~~..=+.                  \n\
\  ++=+==+.   + ~~~..~~=+.               \n\
\  ==~=:~==   =,~~~=.==.~=+.             \n\
\ .+=~..~=   :=~.~=.=,..,~~=+?           \n\
\ .=+:,.~=.  .~.:.~,.,,,,.=~==~+7        \n\
\  .=  .~~:  ,~~.,,=,,:,,,~~~=+==.       \n\
\       .,=.~~~=.,=,,..=,~==~=+=~+==7    \n\
\        .~=~=~:.~~~~~~~~~=~===.===~+==  \n\
\       7.~~==~~,,~=.~~~=.:..~~+=  +=.   \n\
\     .=~.=,,~,,.,,~~~.         .  =        \n\
\ 'Voce esta morto!' "


mountainWolfDialogue = "Um lobo da montanha te ataca!\n\n\
\                       +:::?            \n\
\                   =II??+?++~           \n\
\          I:    7?7??   =++++==?       \n\
\         7 +  I?I  ?~~~~~++I+~=?II7I~7  \n\
\      7   ~ +  7+      ~II++~    =????: \n\
\   +      =         :II++?II??~  =??7I+ \n\
\    =II~       I~7IIIIIIIII+?++III77I+  \n\
\             ?++IIII+II?I++?II+==~?     \n\
\   ?   :    +I?IIIIII++II=::==~~        \n\
\ I    =7  ~II777+??I+I+?I=~~?II++=:     \n\
\I       II=7IIIII7III+?7IIIIIIII,,,:    \n\
\:      77?77+I?+I?+++II~=7I~7IIII7+     \n\
\?~++~+=:7=+II++7II+7I++I? 7?:7?=??      \n\
\       :7~IIIII+IIIII++7I   +=7         \n\
\       ?I=IIIII+?77?=I7III              \n\
\       ~I?I+II7~=~~?7II77:              \n\
\      =I7~+?II+=  =~77+?I7              \n\
\  7~~+=I?I++==+=   +=7I7+77             \n\
\  =~~~++II+I++~    ++?7??I?II?:         \n\
\    =:~+++++++:      ++III?+??+?        \n\
\    +~+++~++=~        +I??++????        \n\
\    =+=~:++~~:        7+????~?+=        \n\
\    =~~~~==~+           ====:=~         \n"

malfoyDialogue = "Malfoy, o mago, aparece diante de voce!\n\n\
\             7II   :                    \n\
\            ??.IIII.:,???III            \n\
\       I I?I??.,????~::?????I?7I        \n\
\  7  I7??IIII  :. 7I.::,IIIIII???7      \n\
\  ?I?I?IIIII   ~:.   :::    7II???7     \n\
\  IIIIIII:7=.  7::, ~~::.     III??     \n\
\   7III7.+  +I  .~~~~::::    I7II?I     \n\
\        .: =I   =~~~~:::::    I I??7    \n\
\         I,I7 ?~~~~==::,:,   7III?I7    \n\
\         +.I   =~~=,.,:,,, 7III??I      \n\
\   7     7 ~,7I~~:,:,,,,,,+I??II7       \n\
\  I7I I?????~  ~~,,,.~~,,:.I7           \n\
\  II???     :..~,I?,===..~~=            \n\
\  I??       :+=+..==~~:,~~.,?           \n\
\  I?        .====.~~:~~.~.,     .=+==   \n\
\  ??         .~~~~+++~~.,..I   +==,     \n\
\  I?I    ?    :I?++++=~,,.     +=~I     \n\
\   I?????      +.++++~...     .+=~      \n\
\  IIIIIII      ~I777.~~=+=   ,+==~      \n\
\    II          +IIII~~=+~======~~      \n\
\                .IIIII.==+=====~~.      \n\
\                ?IIII?+~==:~~~~~7       \n\
\               .=:++++.~:=+..7          \n\
\               ~~~~~+  ~=+++.           \n\
\                         ~~        \n\
\'SECTUMSEMPRA!' "

robinhoODoFilmeDialogue = "Robinho, o do Filme, atira uma flecha em sua frente! \n\n\
\          :                     I...    \n\
\        ~=                  ?,:~I,      \n\
\       :=7     ::===.    =~:IIIIIII,    \n\
\     ?~=.  ?=====~I    .:+??II::.+I.    \n\
\    ~~== .======I    ,~+??,:=IIII+      \n\
\    ~==:==========I.:+=~=????????III    \n\
\   :==============~.,.+++,,~,.:+?II.    \n\
\  7~===========::~~:+.~.+??????I,       \n\
\  :~=~=====~~~~=~~.:+++++???+~          \n\
\ ,:~=~~~~~~~~~~~====:..,++????I,        \n\
\ I~~~~~~~~~~~~~~~~~.   =~++?????I+      \n\
\  7,~,,     ~~~~~~~~7 =~++++?,I   .?    \n\
\       ?==, ,~~~,,.=  ~.?????I          \n\
\      ?+~~~=~~~~~~~, ~~+?II,~7          \n\
\      ++7+~~+??+7.~..~.+?~~~=~I         \n\
\      ?I=+~~??+=I.~~~~~~~~~==~~ ~,      \n\
\     I~:=~~~+?+==~~~~:~~~~~==~~:~~,     \n\
\       ,:~~~~~~~~:~:,=~~~.,.=~~.~~~.    \n\
\       ~=:~~~~~~:.~~,=====~ =~~~~=~~    \n\
\     ,=~~~:      ========~~ .==~.==,.   \n\
\  ,:==:~,      ~==~~I         I .~=~~   \n\
\ ::==~=~     7~==~=~?         ===.==~~I \n\
\ +  .~~I    ~=:I=~=~~        ~=~~=,~.=: \n\
\    .       ...               ~   ,? ?  \n\
\             I                       \n"

singleEyedGladiatorDialogue = "O gladiador de um so olho te convoca para a batalha!\n\n\
\             ++=+                  \n\
\            ==:?:=~,I=~~=?=           \n\
\            =~   I=~=:  ,~:=            \n\
\            ~~   ~:        ,~~+         \n\
\            ?~==~~~,       7:=          \n\
\           +======~~:~~,                \n\
\        :=~:~==~=~=.~~~~~~~~=           \n\
\      ,+==~:~======:,=~~~~~~~~:         \n\
\     ,====:==:::~====~~~~~~~~~~~I       \n\
\     +~===,==?=======~~~~===~~~~~,      \n\
\    ~==~===.==:=====~~~~~===~~~~~~,     \n\
\    ?==~+===~.~~~~~~~~~~~,+==~~~~~~I    \n\
\   ?===~+=============~~~~:====~~~~:    \n\
\  ======,=====~~~=====~~~~:~====~~~~    \n\
\  .====~~,~~~====,~~~~~~:~~~I===~~~~    \n\
\II==,~~~~~==~===~=====~~~~~:I?~=~~~~:   \n\
\====..~~  .==========~~~,+II=?===~~~~,  \n\
\I~==~~..  ,I+II777,~?I7777~,.====~~~~~  \n\
\ =,:??:: ?=~,+7777=777777+~~~:===~~~~:  \n\
\    :~: .===:+7777I7777.====~.==~~~~~   \n\
\        ~===I+77777I  :=====~~,         \n\
\    ~,,:,,=~~,I77II.  =====~.,.?        \n\
\ ~==,,,=?=~~~~~:    II==~=+???=?,:,     \n\
\    ?=~~~~:~        ======:==~~,==~~    \n\
\                        ~,,,.=       \n\
\ 'MORRA!' "

itzelDialogue = "Itzel, a intercambista mexicana grita para você!\n\n\
\         :::  II?77                \n\
\                 :7                   \n\
\         ,I=I7~   7                     \n\
\        ?,7   ~?  I    ::?            \n\
\       +~    II77777I:~~,:?             \n\
\       ~    +77.,+777I =~,              \n\
\           +7+++,?I:I. ::,              \n\
\           ~I7777I.II  ?:,              \n\
\           =7IIII,7I:   :,              \n\
\           ?:   ,   I+  :,              \n\
\                 =+?=++7I:              \n\
\               ?~7,+~ =7II~       \n\
\ 'PENDEJO!!' "

hydellDialogue = "Hydell, o arqueiro das trevas surge diante de você! \n\n\
\      .+      .+==+.                    \n\
\  .+..=++    :~~~..=+.                  \n\
\  ++=+==+.   + ~~~..~~=+.               \n\
\  ==~=:~==   =,~~~=.==.~=+.             \n\
\ .+=~..~=   :=~.~=.=,..,~~=+?           \n\
\ .=+:,.~=.  .~.:.~,.,,,,.=~==~+7        \n\
\  .=  .~~:  ,~~.,,=,,:,,,~~~=+==.       \n\
\       .,=.~~~=.,=,,..=,~==~=+=~+==7    \n\
\        .~=~=~:.~~~~~~~~~=~===.===~+==  \n\
\       7.~~==~~,,~=.~~~=.:..~~+=  +=.   \n\
\     .=~.=,,~,,.,,~~~.         .  =        \n\
\ 'Voce esta morto!' "

durgessDialogue = "Um novo oponente surge! \n\n\
\                  .I=?        :7II~7    \n\
\         +++?.?, 7 7 ..?.    77,.       \n\
\           =?=?.77777777I?  77II        \n\
\      7I7.=?77III7IIIII .7  7.I +       \n\
\     777:~~ 7I, 7I~IIII..:.I7:      .   \n\
\     II .II  7.~++~,III:.  :7I=+~,=I    \n\
\    II.7777I=IIIII ~II. I    ?7777I     \n\
\    =I~I    ?I  ,+?.+.   .              \n\
\     I .I,   7  ?  7III  I.             \n\
\      . I    7II7II.  III7              \n\
\        I     .777II7777,            \n\
\'Voce esta morto! "

terakDialogue = "Terak surge diante de voce! \n\n\
\      .+      .+==+.                    \n\
\  .+..=++    :~~~..=+.                  \n\
\  ++=+==+.   + ~~~..~~=+.               \n\
\  ==~=:~==   =,~~~=.==.~=+.             \n\
\ .+=~..~=   :=~.~=.=,..,~~=+?           \n\
\ .=+:,.~=.  .~.:.~,.,,,,.=~==~+7        \n\
\  .=  .~~:  ,~~.,,=,,:,,,~~~=+==.       \n\
\       .,=.~~~=.,=,,..=,~==~=+=~+==7    \n\
\        .~=~=~:.~~~~~~~~~=~===.===~+==  \n\
\       7.~~==~~,,~=.~~~=.:..~~+=  +=.   \n\
\     .=~.=,,~,,.,,~~~.         .  =        \n\
\ 'Voce esta morto!' "

ilyDialogue = "Ily te ataca!\n\n\
\         :::  II?77                \n\
\                 :7                   \n\
\         ,I=I7~   7                     \n\
\        ?,7   ~?  I    ::?            \n\
\       +~    II77777I:~~,:?             \n\
\       ~    +77.,+777I =~,              \n\
\           +7+++,?I:I. ::,              \n\
\           ~I7777I.II  ?:,              \n\
\           =7IIII,7I:   :,              \n\
\           ?:   ,   I+  :,              \n\
\                 =+?=++7I:              \n\
\               ?~7,+~ =7II~       \n"


noxDialogue = "Nox aparece em sua frente! \n\n\
\                   +.~??:~              \n\
\              I:...:+++++++.            \n\
\           ~,+???+++,~=?????=:+         \n\
\           ..???=,:~,=:,,,,.~++++       \n\
\           .=??~, I:+=~+======:++:      \n\
\         ,,~:~?~.:::=+.++++++++++::     \n\
\         =?~=???=,~~=+.:.?.,  =.=++.    \n\
\          ?:::??++++.+:~?        ?,+?   \n\
\         =.=~=:,~~====+~,           I   \n\
\        ?..+=========+.:                \n\
\         ?,~+====.++~.,      I          \n\
\   I.::=+++~++==,??+~+   :+??~          \n\
\ 7:?=:+++++.++~+??+.++~ :,?++=~7      \n\
\ 'Morre ai, princesa.' "

kingForgusGhostDialogue = "O fantasma do Rei Forgus te ataca!\n\n\
\                       +:::?            \n\
\                   =II??+?++~           \n\
\          I:    7?7??   =++++==?       \n\
\         7 +  I?I  ?~~~~~++I+~=?II7I~7  \n\
\      7   ~ +  7+      ~II++~    =????: \n\
\   +      =         :II++?II??~  =??7I+ \n\
\    =II~       I~7IIIIIIIII+?++III77I+  \n\
\             ?++IIII+II?I++?II+==~?     \n\
\   ?   :    +I?IIIIII++II=::==~~        \n\
\ I    =7  ~II777+??I+I+?I=~~?II++=:     \n\
\I       II=7IIIII7III+?7IIIIIIII,,,:    \n\
\:      77?77+I?+I?+++II~=7I~7IIII7+     \n\
\?~++~+=:7=+II++7II+7I++I? 7?:7?=??      \n\
\       :7~IIIII+IIIII++7I   +=7         \n\
\       ?I=IIIII+?77?=I7III              \n\
\       ~I?I+II7~=~~?7II77:              \n\
\      =I7~+?II+=  =~77+?I7              \n\
\  7~~+=I?I++==+=   +=7I7+77             \n\
\  =~~~++II+I++~    ++?7??I?II?:         \n\
\    =:~+++++++:      ++III?+??+?        \n\
\    +~+++~++=~        +I??++????        \n\
\    =+=~:++~~:        7+????~?+=        \n\
\    =~~~~==~+           ====:=~         \n"
