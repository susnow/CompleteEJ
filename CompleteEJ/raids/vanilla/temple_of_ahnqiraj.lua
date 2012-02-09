local _, db = ...
local db, CreateInstance, Stage, Spell = db[2], db.CreateInstance, db.Stage, db.Spell

local VANILLA, TBC, WOTLK = 1, 2, 3

local N5, H5, N10, N25, H10, H25, RF = 1, 2, 1, 2, 3, 4, 5

local PHASE, CREATURE, ABILITY = 0, 1, 2

local TANK = 0
local DPS = 1
local HEALER = 2
local HEROIC = 3
local DEADLY = 4
local IMPORTANT = 5
local INTERRUPT = 6
local MAGIC = 7
local CURSE = 8
local POISON = 9
local DISEASE = 10
local ENRAGE = 11
local ENRAGE2 = 12

local TEMPLE_OF_AHNQIRAJ = CreateInstance({
  name = "���������",
  desc = "�������ǹ��ϳ��������۹���˯�ĵط�,��WOW1��9�汾�����ͨ������һϵ�еľ�������;�Ӣ�������׳�֮��,�Ӷ����븱������������Ͱ���������.�����������еķ��棨20�˸����������������������������ص�������Ʒ�Ի�ȡ��Ӧ��װ��,������������׳�t2.5����װ.��60���׶��Ƿǳ����ŵ����������ŶӸ���.����׳�۵Ŀ��������У���Ҳ��������͵���ͭ������������Ⱥ֮�����������,���Ҵ����ҿ����׳�֮�ŵ��������컹�ܻ�����ļ׳�����.������Ҳ��ħ��������ʷ�ϵ�һ������������Ʒ�һ���װϵͳ�ĸ���.",
  texture = "TempleofAhnQiraj",
  area = 766,
  dflag = N10,
}, {
  {
    name = "Ԥ����˹����ķ",
    desc = "Ԥ����˹����ķ���Ϲ�֮����ն�Ԥ�Ե�ʼ��ٸ��.",
    --icon = true,
    creature = 15263,
    display = 15345,
    coords = {0.459, 0.518, 2},
    loot = {21703,21699,21702,20731,21708,22222,21704,20734,21814,20736,},
    sections = {
      Spell(26194, {desc = "�����Ե���������Ŀ��,�������149~174����Ȼ�˺�,��ʹ����2���ڲ���ʩ��.\nԤ���߻�������ϵ�ÿ��ʩչ�������,ֱ�����ı������ܵ���ս�������˺�.", flag1 = TANK, flag2 = IMPORTANT}), -- Earth Shock
      Spell(26192, {desc = "����һ����ʩ����Ϊ���ĵ�ħ����ը���Ը���30���ڵĵ������187~217������˺�.", flag1 = MAGIC, flag2 = INTERRUPT}), -- Arcane Explosion
      Spell(785, {desc = "��Ԥ����˹����ķ������������.�ܵ�����ʱ,Ŀ������з����Ա�Ϊ˲��,��ɵ��˺����300%,���п������50,�����ƶ��ٶ����40%,����20��.", flag1 = IMPORTANT}), -- True Fulfillment
      Spell(747, {name = "�ٻ�����", desc = "Ԥ����˹����ķ��Ѫ������75%,50%,25%��ʱ����ٻ�������Ѫ��ͬ�ȵĻ���,���Ӧ�����Ȼ�ɱ������,����������ҵ����Ǳ�Ԥ���߿���."}, 1), -- Summon Images
      Spell(4801, {desc = "Ԥ���������Ļ����ཻ��λ��."}), -- Teleport (8195, 20449, duplicates?)
      --Spell(3730), -- Initialize Image
      --Spell(20477), -- Summon Player
    },
  },
  {
    name = "������Ⱥ����ͷ(��������)",
    desc = "����ѫ�����Ƕ���������άķ�����������ֳ汻��Ϊ�������ļ�������.",
    --icon = true,
    creature = 15511,
    display = 15656,
    coords = {0.284, 0.497, 1},
    loot = {20727,21603,21232,21695,21681,21692,20731,21694,20736,},
    sections = {
      Stage({
        stype = CREATURE,
        creature = 15511,
        display = 15656,
        name = "����ѫ��",
        sections = {
          Spell(25812, {desc = "��Ŀ�����450~750����Ȼ�˺�,����ÿ2����ɶ����150����Ȼ�˺�,����16��.���Ч�����Ե���20��.", flag1 = POISON}), -- Toxic Volley
          Spell(40504), -- Cleave
          Spell(3391), -- Thrash
          Spell(26590, {so = true, desc = "�����Ķ��������ſ���ѫ��,���ڽ��ĵ������ÿ��2000����Ȼ�˺�,����2����,ͬʱ������Ӱ�������ƶ��ٶȽ���40%,����9��.", flag1 = DEADLY}), -- Summon Poison Cloud
          --Spell(20477), -- Summon Player
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15543,
        display = 15657,
        name = "�Ƕ�������",
        sections = {
          Spell(25807, {desc = "Ϊһ�����ѻָ�69375~80625������ֵ.", flag1 = INTERRUPT, flag2 = IMPORTANT}), -- Great Heal
          Spell(26580, {desc = "ʹ45���ڵĵ��˸е��־岢����,�������8��.", flag1 = MAGIC}), -- Fear
          Spell(3242), -- Ravage
          --Spell(20477), -- Summon Player
          Spell(26590, {so = true, name = "��Ⱥ", desc = "�Ƕ���������ɱ������ٻ�������С�����ֳ�ĳ�Ⱥ."}, 1),
          --Spell(26662), -- Berserk
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15544,
        display = 15658,
        name = "άķ",
        sections = {
          Spell(26561, {desc = "�Ե��˷�����,������˲������ͨ�˺����300���˺�", flag1 = IMPORTANT}), -- Berserker Charge
          --Spell(18670), -- Knock Away
          Spell(19128, {desc = "��Ŀ�꼰����ߵĵ�������˺�,��ʹ�����2��.����Ӱ��5��Ŀ��."}), -- Knockdown
          Spell(26590, {so = true, name = "��ŭ", desc = "άķ��ɱ����,����ѫ�����Ƕ��������Ĺ����ٶ����150%,�����˺����100%.", flag1 = IMPORTANT}, 1),
          --Spell(20477), -- Summon Player
          --Spell(25790), -- Vengeance
        },
      }),
      Spell(26662, {so = true, desc = "���ս��ʱ�䳬��15����,����BOSS�Ĺ������ƶ��ٶ����150%,�Ե�����ɵ������˺����500%.�������߳���."}), -- Berserk
    },
    adds = {
      {
        name = "�Ƕ�������",
        creature = 15543,
        display = 15657,
      },
      {
        name = "άķ",
        creature = 15544,
        display = 15658,
      },
    },
  },
  {
    name = "ս������ɳ��ͼ��",
    desc = "ս������ɳ��ͼ�������������ʼ����������Ű����������������.",
    --icon = true,
    creature = 15516,
    display = 15583,
    coords = {0.444, 0.338, 1},
    loot = {21237,21648,21675,21672,20731,21667,76402,21668,20734,21673,20727,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15984,
        display = 15465,
        name = "ɳ��ͼ���ʼ�����",
        sections = {
          Spell(26027, {desc = "��10���ڵ����е��˻���,���Һ�������.", flag1 = IMPORTANT}), -- Knockback
          Spell(26038, {desc = "������һ��������е�����,�Ը����ĵ������ÿ����ͨ�˺��ټ���1080~1320���˺�,����8��."}), -- Whirlwind (triggers 26686 each second)
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15516,
        display = 15583,
        name = "ս������ɳ��ͼ��",
        sections = {
          Spell(25174, {desc = "��Ŀ����丽�������������ͨ�����˺��ټ���30������˺�,����Ӱ��3��Ŀ��.ͬʱʹ�令�׽���240��,����30��.", flag1 = TANK}), -- Sundering Cleave
          Spell(26083, {desc = "������һ��������е�����,�Ը����ĵ������ÿ����ͨ�˺��ټ���680~920���˺�,����15��."}), -- Whirlwind (triggers 26084 each second)
          Spell(8269, {desc = "��ս������ɳ��ͼ������ֵ����20%����ʱ,�����ٶ����60%."}), -- Frenzy
        },
      }),
      Spell(26662, {so = true, desc = "��ս��ʱ�䳬��10����֮��,ɳ��ͼ�������״̬,�����ٶ����150%,�����˺����500%."}), -- Berserk
    },
    adds = {
      {
        name = "ɳ��ͼ���ʼ�����",
        creature = 15984,
        display = 15465,
      },
    },
  },
  {
    name = "��ǿ�ķ�����˹",
    desc = "��ǿ�ķ�����˹�ǰ���������1��BOSS�����ɿ�˹���ֳ�.",
    --icon = true,
    creature = 15510,
    display = 15743,
    coords = {0.621, 0.228, 1},
    loot = {76402,21664,21663,20727,22402,21650,21627,21232,21639,20730,},
    sections = {
      Spell(518, {so = true, desc = "�ڷ�����˹���ڵķ�����,������˹��צ����������ص�ˢ�²��Ҽ���ս��.", flag1 = DEADLY, sections = {
        Stage({
          stype = CREATURE,
          creature = 15630,
          display = 15582,
          name = "������˹��צ��",
          flag1 = DEADLY,
          sections = {
            Spell(26662, {so = true, desc = "�����20���ʱ������ɱˢ�µķ�����˹��צ��,����20��֮��,������˹��צ��������״̬,�ƶ��ٶȺ͹����ٶ����150%,�˺����500%,�������߳���.", flag1 = DEADLY}), -- Berserk
          },
        }),
      }}), -- Summon Worm (25831, 25832, all the 3 locations got their own spell)
      Spell(720, {so = true, desc = "��ǿ�ķ�����˹�ĳ�Ѩ��Ŀ�������������ֳ����·����,���������8��.", flag1 = IMPORTANT, sections = {
        Stage({
          stype = CREATURE,
          creature = 15962,
          display = 15362,
          name = "ά�������",
          desc = "�Կ����ķ�̹��������900���˺�,��̹�������ɵ��˺�����.",
        }),
      }}), -- Entangle (731, 1121, all the 3 tunnels got their own spell)
      Spell(25646, {so = true, desc = "��Ŀ����гͽ���,ʹ���ܵ������Ʒ���Ч������10%.", flag1 = TANK}), -- Mortal Wound
    },
    adds = {
      {
        name = "������˹��צ��",
        creature = 15630,
        display = 15582,
      },
      {
        name = "ά�������",
        creature = 15962,
        display = 15362,
      },
    },
  },
  {
    name = "άϣ��˹",
    desc = "άϣ��˹��һ���ɱ�������BOSS,�������Ҫ��ɱ���BOSS��Ҫ�ǳ��ߵ���Ȼ����װ��֧��.�������ں����BOSS����ս��ʱ��Ҫ�����˵�ʱ��,�����ӳ����ķ������������BOSS.",
    --icon = true,
    creature = 15299,
    display = 15686,
    coords = {0.721, 0.181, 1},
    loot = {20734,21232,21623,20932,21625,76402,22399,20727,},
    sections = {
      Stage({
        name = "����������׶�",
        desc = "Ҫ����άϣ��˹��Ҫ��ʱ�������ɱ�˪�˺�,�˺��Ĵ�С���ǹؼ�,�ؼ����ڶ��������Ĵ���.",
        sections = {
          Stage({
            so = true,
            name = "άϣ��˹������!",
            desc = "�ƶ��ٶȺ͹����ٶȽ���15%,Ҫ�ﵽ����׶���Ҫ��άϣ��˹����100�α�˪����.",
          }),
          Stage({
            so = true,
            name = "άϣ��˹�챻��ס��!",
            desc = "�ƶ��ٶȺ͹����ٶȽ���30%,Ҫ�ﵽ����׶���Ҫ��άϣ��˹����150�α�˪����.",
          }),
          Stage({
            so = true,
            name = "άϣ��˹����ס��!",
            desc = "�ƶ��͹�����ֹͣ��,Ҫ�ﵽ����׶���Ҫ��άϣ��˹����200�α�˪����.����Ϊֹ,����������׶���ʱ����,�����ⲫ�������׶�.",
          }),
        },
      }),
      Stage({
        name = "�ⲫ�������׶�",
        desc = "һ��άϣ��˹������ɱ���,��ô��Ҿ���Ҫ���������ⲫ�����ⶳ,Ȼ���ٴν������������׶�.",
        sections = {
          Stage({
            so = true,
            name = "άϣ��˹��ʼ�ⶳ��!",
            desc = "����������.",
          }),
          Stage({
            so = true,
            name = "άϣ��˹׼���ܽ���!",
            desc = "����������.",
          }),
          Stage({
            so = true,
            name = "άϣ��˹ը����Ƭ��!",
            desc = "άϣ��˹���ѳ�20��άϣ��˹ˮ��,���������м��£,�������ºϲ���άϣ��˹�ı���,Ȼ���ٴν������������׶�.",
          }),
          Stage({
            stype = CREATURE,
            creature = 15667,
            display = 12349,
            name = "άϣ��˹ˮ��",
            desc = "ˮ�δ����ܻ����������м��£,׼�����º����άϣ��˹�ı���.",
          }),
        },
      }),
      Spell(25993, {so = true, desc = "��ʩ����ǰ����15��������Ŀ���罦��Һ,�������1050~1350����Ȼ�˺�.", flag1 = IMPORTANT}), -- Poison Shock
      Spell(25991, {so = true, desc = "������������,�������1313~1687����Ȼ�˺�,��ÿ2�����һ�ζ����413~587����Ȼ�˺�,����10��,���Ч�����Ե���99��.", flag1 = POISON}), -- Poison Bolt Volley
      Stage({
        so = true,
        stype = ABILITY,
        icon = "Interface\\Icons\\INV_Misc_Slime_01",
        name = "Toxin Clouds",
        desc = "ÿ��30~40��άϣ��˹�����һ������ͷ�һ�Ŷ���,�ܵ�����Ӱ����������ÿ�����ܵ�1500����Ȼ�˺�,�����ƶ��ٶȽ���40%.",
        flag1 = DEADLY,
      }),
      --Spell(26608), -- Despawn Globs
      --Spell(20477), -- Summon Player
    },
    adds = {
      {
        name = "άϣ��˹ˮ��",
        creature = 15667,
        display = 12349,
      },
    },
  },
  {
    name = "����������",
    desc = "������������һͷ���ַ�,������ս��Ҫȫ�����÷ǳ��ߵ���Ȼ����.",
    --icon = true,
    creature = 15509,
    display = 15739,
    coords = {0.436, 0.505, 1},
    loot = {20731,21232,21617,20932,21620,20727,21616,20734,},
    sections = {
      Spell(26050, {desc = "��Ŀ��ÿ2���ܵ�һ��219~281����Ȼ�˺�,����30��,���Ч�����Ե���99��.", flag1 = TANK}), -- Acid Spit
      Spell(26053, {desc = "��Ŀ���Լ���Ŀ��뾶15�뷶Χ�ڵ����е����³��綾��Һ,�������750����Ȼ�˺���ʹ���Ĭ8��.", flag1 = IMPORTANT}), -- Noxious Poison
      Spell(26180, {desc = "����Ŀ��,ʹ���˯12��.�κ��˺�����ȡ����˯Ч��.", flag1 = POISON}), -- Wyvern Sting
      Spell(26051, {so = true, desc = "�����������150%,����8��,ͬʱÿ4�������������1500~2500����Ȼ�˺�.", flag1 = ENRAGE}), -- Enrage
      Spell(26068, {so = true, desc = "����������������ֵ����30%֮��,�����ٶ����200%,ÿ2�������������1500~2500����Ȼ�˺�.", flag1 = DEADLY}), -- Berserk
    },
  },
  {
    name = "˫�ӻʵ�",
    desc = "˫�ӻʵ�ά������˹��ۺ�ά��������,����Ϊ���ʺ�ħ�ʵ������۹�������.",
    --icon = true,
    creature = 15276,
    display = 15778,
    coords = {0.605, 0.698, 1},
    loot = {20726,20735,21232,21597,21598,21602,21604,21606,21609,76402,},
    sections = {
      Stage({
        so = true,
        name = "˫�ӻʵ۹��е�����",
        sections = {
          Spell(7393, {so = true, desc = "˫�ӻʵ������60�����ڵ�ʱ��������������Ч��,ÿ��Ϊ˫�ӻʵۻָ�30000������ֵ.", flag1 = IMPORTANT}), -- Heal Brother
          Spell(800, {so = true, desc = "ÿ��30~40��,˫�ӻʵۻụ�ཻ��λ��,����֮���һ������˫�ӻʵ۵���һ��������еĳ��,������ս��������ζ����Ҫ���ź�̹�����Ա��ڻ���֮����ٵ�����BOSS�ĳ��.", flag1 = IMPORTANT, flag2 = TANK}), -- Twin Teleport
          --Spell(20477), -- Summon Player
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15276,
        display = 15778,
        name = "ά��������",
        desc = "ħ��,�����κ�������r.",
        sections = {
          Spell(26006, {desc = "��Ŀ�����һ֧��Ӱ�����������3600~4400�㰵Ӱ�˺�."}), -- Shadow Bolt
          Spell(26607, {desc = "����ı���������,ÿ2���Ŀ�����1388~1612���˪�˺�,����10��.ͬʱ�ܵ�����ѩӰ�������ƶ��ٶȽ���30%.", flag1 = IMPORTANT}), -- Blizzard
          Spell(568, {flag1 = TANK}), -- Arcane Burst
          Spell(804, {desc = "������ע��һֻ30���ڵ�ʥ�׳�����,ʹ����3���ը,��15�뷶Χ�ڵ����е������2813~3187������˺�.", flag1 = IMPORTANT}), -- Explode Bug
          Spell(27897, {desc = "ս��ʱ�䳬��15����֮��ά�������۽������״̬,ÿ4��ʩ��һ�ΰ�����ը,�����е������2480~2900������˺�.", flag1 = DEADLY}), -- Frenzy
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15275,
        display = 15761,
        name = "ά������˹���",
        desc = "����,���߳�����ʥ����֮����κη����˺�.",
        sections = {
          Spell(26007, {desc = "��Ŀ�������ͨ�������˺����950~1050�������˺�,���������.", flag1 = TANK}), -- Uppercut
          Spell(26613, {flag1 = HEALER}), -- Unbalancing Strike
          Spell(802, {desc = "ʹ25�뷶Χ�ڵ�һֻʥ�׳�����ֵ���300%,�˺����1800%,��������400%.", flag1 = IMPORTANT}), -- Mutate Bug
          Spell(27680, {desc = "ս��ʱ�䳬��15����֮��,ά������˹��۽������״̬,�ƶ��ٶ����150%,�����˺����500%.", flag1 = DEADLY}), -- Berserk
        },
      }),
    },
    adds = {
      {
        name = "ά������˹���",
        creature = 15275,
        display = 15761,
      },
    },
  },
  {
    name = "����",
    desc = "���ն����ִ������ɳ������,��һ������Ĵ���.�᲻�ɴݵ���Ǻ����ɵ��ƶ�����,�����ǰ����Ź�����ն������һ���ؿ�",
    --icon = true,
    creature = 15517,
    display = 15509,
    coords = {0.304, 0.819, 1},
    loot = {20731,21232,23558,20931,23570,20728,21610,20730,},
    sections = {
      Stage({
        so = true,
        name = "��һ�׶�",
        sections = {
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Nature_Earthquake",
            name = "Ǳ�����",
            desc = "�����굽����,�޷�������,ͬʱ�����᲻ͣ�ĶԵ����ϵ����������ɳ,�����ս��Χ�ڳ�ʱ��û��Ŀ��,����Ҳ���굽����.",
            flag1 = IMPORTANT,
            sections = {
              Spell(26058, {so = true, name = "ɳ������", icon = "Interface\\Icons\\INV_Misc_Dust_02", desc = "�����ڵ����궯,��8���ڵر��������675~825����Ȼ�˺�,һ�����ͷ�5��.", flag1 = IMPORTANT}, 1), -- Summon Ouro Mounds
              Spell(26100, {so = true, desc = "�����������������,ʹ�ر��Ŀ����µĴ������,���2250~2750���˺����������,ͬʱ�ٻ��������İ��޼׳�.", flag1 = IMPORTANT}), -- Ground Rupture
              Stage({
                so = true,
                stype = CREATURE,
                creature = 15718,
                display = 11108,
                name = "���޼׳�",
                desc = "�����Ű����������,���޼׳潫���ע��һ��Ŀ��,�������������30~400���˺�,45�����޼׳���ʧ.",
              }),
            },
          }), -- Submerge
          Spell(26103, {desc = "��30�뷶Χ�����е������2625~3375���˺����������.", flag1 = TANK}), -- Sweep
          Spell(26102), -- Sand Blast
        },
      }),
      Stage({
        so = true,
        name = "�ڶ��׶�",
        desc = "����������ֵ����20%,�ڶ��׶ο�ʼ.",
        sections = {
          Spell(26615, {so = true, desc = "���޽������״̬,�����ٶ����150%.", flag1 = DEADLY}), -- Berserk
          Spell(26616, {so = true, icon = "Interface\\Icons\\INV_Stone_10", desc = "������׶�,������޵Ľ�ս��Χ��û��Ŀ��,���������һ�����Ͷ���޴��ʯ��,���6000���˺�.", flag1 = DEADLY}, 1), -- Boulder
        },
      }),
    },
    adds = {
      {
        name = "���޼׳�",
        creature = 15718,
        display = 11108,
      },
    },
  },
  {
    name = "���ն�",
    desc = "5��Զ��а��֮һ,����ϣ����˹��һ��ս���б�����,���ն�һ�ȱ���Ϊ�Ѿ���������,������������Ϊ�������˵�Ļ����ʹ�ٶȳ���.��ɳ֮ս��,�����Ƿ�ӡ�˼׳�֮ǽ,���������˷����İ���������֮��,�����Ｘǧ������ʩչ������������������������,�𽥿���������ϣ����˹.",
    --icon = true,
    creature = 15589,
    display = 15556,
    coords = {0.570, 0.630, 3},
    loot = {21585,22731,20929,20933,22732,21134,21586,21126,},
    sections = {
      Stage({
        so = true,
        name = "��һ�׶�",
        desc = "����׶ν����������ն�֮�۱��ݻ�.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15589,
            display = 15556,
            name = "���ն�֮��",
            sections = {
              Spell(32950, {so = true, flag1 = IMPORTANT}), -- Eye Beam
              Spell(26029, {so = true, desc = "���ѡ��һ���ж�Ŀ��,�������һ���ڰ�����,���ն�֮��˳ʱ�������ʱ����ת180��,������ɨ�䵽�������������.", flag1 = DEADLY}), -- Dark Glare
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15726,
            display = 15788,
            name = "������",
            desc = "ÿ45���ڿ��ն���Χˢ��һ��������,��վ��ˢ�µ��ϵĵж�Ŀ�����1350~1650���˺����������.",
            sections = {
              Spell(26143, {so = true, desc = "�Եж�Ŀ��ÿ�����750�㰵Ӱ�˺�,����10��,ʹ���ƶ��ٶȽ��͵���ͨ�ٶȵ�30%.", flag1 = IMPORTANT}), -- Mind Flay
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15726,
            display = 15788,
            name = "��צ����",
            desc = "���ˢ��һ����צ����,��վ��ˢ�µ��ϵĵж�Ŀ�����1350~1650���˺����������.",
            sections = {
              Spell(26141, {so = true, desc = "�Ե�����������˺��ټ���463~537������˺�,��ʹ���ƶ��ٶȽ���70%,����10��.", flag1 = IMPORTANT}), -- Hamstring
            },
          }),
        },
      }),
      Stage({
        so = true,
        name = "�ڶ��׶�",
        desc = "�ڶ��׶ο��ն��ı��彫�����,ֱ�����ն���ɱ��.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15727,
            display = 15787,
            name = "���ն�",
            desc = "ÿ��10��,���ն������һ�����������������.",
            sections = {
              Stage({
                so = true,
                stype = CREATURE,
                creature = 15802,
                display = 15793,
                name = "�޹�����",
                desc = "���ն����ڵľ޹����뱻�ƻ���,���ն�������45��.",
                flag1 = IMPORTANT,
              }),
              Spell(26476, {so = true, desc = "�ڿ��ն������ڵ���ҽ�ÿ5���ܵ�150���˺�,���Ч�����Ե���99��.", flag1 = DEADLY}), -- Digestive Acid
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15726,
            display = 15788,
            name = "������",
            desc = "ÿ45���ڿ��ն���Χˢ��һ��������,��վ��ˢ�µ��ϵĵж�Ŀ�����1350~1650���˺����������.",
            sections = {
              Spell(26143, {so = true, desc = "�Եж�Ŀ��ÿ�����750�㰵Ӱ�˺�,����10��,ʹ���ƶ��ٶȽ��͵���ͨ�ٶȵ�30%.", flag1 = IMPORTANT}), -- Mind Flay
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15334,
            display = 15948,
            name = "���۴���",
            desc = "ÿ��1����,���ն����ٻ�һ�����۴���,��������2250~2750���˺�,���������.",
            sections = {
              Spell(26134, {so = true, flag1 = IMPORTANT}), -- Eye Beam
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15728,
            display = 15790,
            name = "��צ����",
            desc = "ÿ��1����,���ն������ٻ�һ����צ����,��������2250~2750���˺�,���������,�����צ�����ս��Χ��û�е���,�����������������һ�����,��ȡ���ǵ�����ֵ����Ϊ�Լ��ָ�����ֵ.",
            sections = {
              Spell(26211, {so = true, desc = "��һ���ж�Ŀ�������ͨ�����˺�����657~843������˺�,Ŀ���ƶ��ٶȽ���70%,����10��."}), -- Hamstring
              Spell(6524, {so = true, desc = "ʹ����20�뷶Χ�ڵĵж�Ŀ�����2��."}), -- Ground Tremor
              Spell(3391, {flag1 = HEALER}), -- Thrash
            },
          }),
        },
      }),
    },
    adds = {
      {
        name = "���ն�",
        creature = 15727,
        display = 15787,
      },
    },
  },
})

table.insert(db, TEMPLE_OF_AHNQIRAJ)
