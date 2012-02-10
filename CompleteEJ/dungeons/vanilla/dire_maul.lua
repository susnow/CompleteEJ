local _, db = ...
local db, CreateInstance, Stage, Spell = db[1], db.CreateInstance, db.Stage, db.Spell

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

local DIRE_MAUL = CreateInstance({
  name = "厄运之槌",
  desc = "埃雷萨拉斯古城是在一万二千年前由当时的一批暗夜精灵法师秘密地建造的，它被用于保护艾莎拉皇后最宝贵的奥法秘密。虽然受到了世界大震动的影响，这座伟大的城市基本屹立在那里，现在其被称为厄运之槌。这座遗迹城市分为三个部分，分别被不同的生物所占据——包括幽灵般的高等精灵，邪恶的萨特和鲁莽的食人魔。只有最勇敢的冒险队伍才敢进入这个破碎的城市并面对远古大厅中邪恶力量。",
  texture = "DireMaul",
  area = 699,
  dflag = N5,
}, {
  {
    name = "普希林",
    desc = "你跟它说话的时候，这恼人的小鬼将一直逃跑直到你跟踪它到它的巢穴。击败它后，你就可以把咒术之书带回并交给门外看守的达格索大使。为了避免绕路，它通常是第一个被击败的东区首领,。"
    --icon = true,
    creature = 14354,
    display = 7552,
    coords = {0.757, 0.445, 5},
    loot = {18261,18267,12662,},
    sections = {
      Spell(22735, {so = true, desc = "进入战斗之后，提高20%攻击速度并反弹50%有害魔法。", flag1 = IMPORTANT}), -- Spirit of Runn Tum
      Spell(17145, {so = true, desc = "施法者放出一道火焰冲击波，所有被冲击波触及的敌人都会受到火焰伤害，同时降低50%移动速度，持续6秒。"}), -- Blast Wave
      Spell(14145, {desc = "对一个敌人造成49到58点火焰伤害。"}), -- Fire Blast
      Spell(15242, {desc = "对一个敌人造成124到145点火焰伤害。"}), -- Fireball
      Stage({
        stype = CREATURE,
        creature = 13276,
        display = 911,
        name = "荒野小鬼",
        desc = "进入战斗后，普希林身边会出现四个荒野小鬼与他一同战斗。",
        sections = {
          Spell(13340, {so = true, desc = "对一个敌人造成24到29点火焰伤害。"}), -- Fire Blast
        },
      }),
    },
  },
  {
    name = "蕾瑟塔蒂丝",
    desc = "她常常是东区第二个被打败的首领。",    --She is often the second boss to be defeated in the east wing.",
    --icon = true,
    creature = 14327,
    display = 21012,
    coords = {0.438, 0.476, 5},
    loot = {18301,18302,18325,18311,},
    sections = {
      Spell(16247, {flag1 = CURSE}), -- Curse of Thorns
      Spell(13338, {flag1 = CURSE}), -- Curse of Tongues
      Spell(20787, {desc = "灼烧敌人，造成49到58点火焰伤害，并在之后的15秒内每3秒造成6点伤害。", flag1 = MAGIC}), -- Immolate
      Spell(14887, {desc = "向附近的敌人射出多支暗影箭，对它们造成74到87点暗影伤害。"}), -- Shadow Bolt Volley
      Spell(22709), -- Void Bolt
      Spell(22710, {desc = "让匹姆吉布变大，使其物理伤害能力提高，施法时间缩短。", flag1 = MAGIC}), -- Enlarge
      Stage({
        so = true,
        stype = CREATURE,
        creature = 14349,
        display = 14380,
        name = "匹姆吉布",
        sections = {
          Spell(22713, {desc = "对一个敌人造成19到21点火焰伤害，并使其受到的火焰伤害提高20点，持续20秒。最多叠加5次。"}), -- Flame Buffet
          Spell(15744, {desc = "施法者放出一道火焰冲击波，所有被冲击波触及的敌人都会受到火焰伤害，同时降低50%移动速度，持续6秒。"}), -- Blast Wave
          Spell(14034, {desc = "对一个敌人造成74到87点火焰伤害。."}), -- Fireball
        },
      }),
    },
  },
  {
    name = "海多斯博恩",--Hydrospawn
    desc = "这个水元素是位于东区的下层，在蕾瑟塔蒂丝之后。",--This elemental is located on the lower level, past Lethtendris in the east wing.",
    --icon = true,
    creature = 13280,
    display = 5489,
    coords = {0.525, 0.700, 6},
    loot = {18317,18324,18322,18307,18305,19268,},
    sections = {
      Spell(22419, {so = true, flag1 = MAGIC}), -- Riptide
      Spell(22420, {so = true, desc = "使附近敌人的耐力降低10点，持续1分钟。可以叠加20次。", flag1 = MAGIC}), -- Submersion
      Spell(22714, {so = true, desc = "召唤2个水浪幼崽来帮助海多斯博恩。"}), -- Summon Hydroling
      Spell(22421, {so = true, desc = "召唤一个巨型喷泉。", sections = {
        Spell(22422), -- Water
      }}), -- Massive Geyser
    },
  },
  {
    name = "瑟雷姆·刺蹄",
    desc = "他是位于东区海多斯博恩之上的一个平台处，有一个斜坡带领你到他面前。",--- There is a ramp leading you up to him.",
    --icon = true,
    creature = 11490,
    display = 11335,
    coords = {0.585, 0.750, 6},
    loot = {18319,18323,18313,18308,18306,},
    sections = {
      Spell(22651, {so = true, flag1 = IMPORTANT}), -- Sacrifice
      Spell(22478, {so = true, flag1 = MAGIC}), -- Intense Pain
    },
  },
  {
    name = "奥兹恩 ",--Alzzin the Wildshaper
    desc = "他接手的厄运之槌的东区和损坏的生育树的果实，因此，它产生邪恶的魔藤碎片。奥兹恩吸引了各种各样的破坏植物,半人马,法师,来魔化他的事业。整个地区疯狂的长满了植物。他是最后的首领扭木的四分之一",
	--He took over the east side of Dire Maul and corrupted the Fruit of Fertility tree so that it produces vile Felvine Shards. Alzzin has attracted all manner of corrupted plant life, satyrs, mages and demons to his cause. The entire district is overgrown with crazed plant life. he is the final boss of the Warpwood Quarter.",
    --icon = true,
    creature = 11492,
    display = 14416,
    coords = {0.563, 0.286, 6},
    loot = {18310,18312,18321,18318,18326,18315,18327,18309,18314,18328,},
    sections = {
      Spell(22691), -- Disarm
      Spell(10101), -- Knock Away
      Spell(22660, {so = true, desc = "荒野变形者奥兹恩变形成一头恐狼，使其近战攻击速度提高75%和近战伤害提高50%。", sections = {
        Spell(19319, {desc = "撕咬敌人，对其造成武器伤害。"}), -- Vicious Bite
        Spell(22689), -- Mangle
      }}), -- Dire Wolf Form
      Spell(22688, {so = true, icon = "Interface\\Icons\\Ability_Druid_ForceOfNature", desc = "荒野变形者奥兹恩变形成一棵树，使其护甲值提高3000点和近战伤害提高25%。", sections = {
        Spell(22128, {desc = "使友方目标身上环绕着荆棘，当其被攻击命中时对攻击者造成20点自然伤害，持续10分钟。", flag1 = MAGIC}), -- Thorns
        Spell(22662, {flag1 = DISEASE}), -- Wither
        Spell(22661, {desc = "每2秒吸取敌人200点法力值，持续8秒。", flag1 = POISON}), -- Enervate
        Spell(7948, {flag1 = MAGIC}), -- Wild Regeneration
      }}), -- Tree Form
      Stage({
        so = true,
        name = "血量到30%",
        desc = "奥兹恩召唤一大群小鬼来帮助他。任何剩余的附近的小怪也会加入战斗。", --summons a horde of imps to help him. Any remaining adds nearby will also join the battle.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 11460,
            display = 911,
            name = "奥兹恩的爪牙",
            desc = "没有特殊技能",
          }),
        },
      }),
    },
  },
  {
    name = "卫兵摩尔达",
    desc = "北区的第一个首领。如果你完成'完美贡品'后回到他身边并受到'摩尔达的勇气'，一个15%耐力为2小时的buff。为了完成'完美贡品'，你必须跳过击杀卫兵摩尔达并向前。最后箱子会掉比他的战利品列表更好的物品,并包含了所有被跳过的首领的掉落。",
	--If you complete the Tribute Run, you can return to him and receive Mol'dar's Moxie, a buff increasing stamina by 15% for 2 hours. In order to complete a Tribute Run, you have to skip killing Guard Mol'dar and carry onward. The end chest will drop better items than his loot table, and combine all skipped bosses.",
    --icon = true,
    creature = 14326,
    display = 11561,
    coords = {0.694, 0.758, 1},
    loot = {18451,18493,18460,18496,18463,18494,18498,18497,18450,18462,18459,18458,18464,},
    sections = {
      Spell(14516, {so = true, desc = "对敌人造成110%近战伤害。"}), -- Strike
      Spell(11972, {so = true}), -- Shield Bash
      Spell(15749, {so = true, desc = "对敌人发起冲锋，将其击退并造成普通伤害外加150点伤害。"}), -- Shield Charge
      Spell(8269, {so = true, desc = "生命值低于20%时狂化，攻击速度提高60%，持续2分钟。"}), -- Frenzy
      --Spell(22818, {flag1 = MAGIC}), -- Mol'dar's Moxie
    },
  },
  {
    name = "践踏者克雷格",
    desc = "北区的第二个首领。如果你完成'完美贡品' 你可以回到他身边补充一下材料。为了完成'完美贡品'，你必须跳过击杀践踏者克雷格并向前。最后箱子会掉比他的战利品列表更好的物品,并包含了所有被跳过的首领的掉落。",
	--"If you complete the Tribute Run, you can return to him and purchace some consumables. In order to complete a Tribute Run, you have to skip killing Stomper Kreeg and carry onward. The end chest will drop better items than his loot table, and combine all skipped bosses.",
    --icon = true,
    creature = 14322,
    display = 11545,
    coords = {0.610, 0.685, 1},
    loot = {18425,},
    sections = {
      Spell(22833, {so = true}), -- Booze Spit
      Spell(16740, {so = true}), -- War Stomp
      Spell(15578, {so = true}), -- Whirlwind
      Spell(8269, {so = true, desc = "生命值低于20%时狂化，攻击速度提高60%，持续2分钟。"}), -- Frenzy
      --Spell(22835, {desc = ""}), -- Drunken Rage
    },
  },
  {
    name = "卫兵芬古斯",
    desc = "北区的第三个首领。如果你完成'完美贡品' 你可以回到他身边获得芬古斯的狂暴，一个攻击强度提高200点。持续两小时的buff。为了完成'完美贡品'，你必须跳过击杀卫兵芬古斯并向前。最后箱子会掉比他的战利品列表更好的物品,并包含了所有被跳过的首领的掉落。",
	--"The third boss in the north wing. If you complete the Tribute Run, you can return to him and receive Fengus' Ferocity, a buff increasing attack power by 200 for 2 hours. In order to complete a Tribute Run, you have to skip killing Guard Fengus and carry onward. The end chest will drop better items than his loot table, and combine all skipped bosses.",
    --icon = true,
    creature = 14321,
    display = 11561,
    coords = {0.496, 0.785, 1},
    loot = {18460,18450,18462,18458,18451,18459,18463,18464,},
    sections = {
      Spell(14516, {so = true, desc = "对敌人造成110%近战伤害。"}), -- Strike
      Spell(11972, {so = true}), -- Shield Bash
      Spell(15749, {so = true, desc = "对敌人发起冲锋，将其击退并造成普通伤害外加150点伤害。"}), -- Shield Charge
      Spell(8269, {so = true, desc = "生命值低于20%时狂化，攻击速度提高60%，持续2分钟。"}), -- Frenzy
      --Spell(22817, {flag1 = MAGIC}), -- Fengus' Ferocity
    },
  },
  {
    name = "卫兵斯里基克",
    desc = "北区的第四个首领。如果你完成'完美贡品' 你可以回到他身边获得斯里基克的机智，一个法术爆击等级提高42，持续两小时的buff。为了完成'完美贡品'，你必须跳过击杀卫兵斯里基克并向前。最后箱子会掉比他的战利品列表更好的物品,并包含了所有被跳过的首领的掉落。",
	--"The fourth boss in the north wing. If you complete the Tribute Run, you can return to him and receive Slip'kik's Savvy, a buff increasing critical strike rating by 42 for 2 hours. In order to complete a Tribute Run, you have to trap him using the nearby trap. The end chest will drop better items than his loot table, and combine all skipped bosses.",
    --icon = true,
    creature = 14323,
    display = 11561,
    coords = {0.264, 0.576, 1},
    loot = {18463,18494,18450,18496,18459,18451,18498,18497,18458,18493,18460,18462,18464,},
    sections = {
      Spell(14516, {so = true, desc = "对敌人造成110%近战伤害。"}), -- Strike
      Spell(11972, {so = true}), -- Shield Bash
      Spell(15749, {so = true, desc = "对敌人发起冲锋，将其击退并造成普通伤害外加150点伤害。"}), -- Shield Charge
      Spell(8269, {so = true, desc = "生命值低于20%时狂化，攻击速度提高60%，持续2分钟。"}), -- Frenzy
      --Spell(22820, {flag1 = MAGIC}), -- Slip'kik's Savvy
      --Spell(22856), -- Ice Lock
    },
  },
  {
    name = "克罗卡斯",
    desc = "北区的第五个首领。如果你完成'完美贡品' 你可以回到他身边并获得一个任务。为了完成'完美贡品'，你必须从诺特·希姆加克那里获得一个戈多克食人魔装。他在卫兵斯里基克那。一个人要使用套装然后和克罗卡斯交谈让他离开岗位，最后的箱子会掉比他的战利品列表更好的物品,并包含了所有被跳过的首领的掉落。",
	--"The fifth boss in the north wing. If you complete the Tribute Run, you can return to him and start a quest. In order to complete a Tribute Run, you have to receive a Gordok Ogre Suit from Knot Thimblejack, he is located near Guard Slip'kik. One person has to use the suit, talk to Kromcrush and make him abandon his post. The end chest will drop better items than his loot table, and combine all skipped bosses.",
    --icon = true,
    creature = 14325,
    display = 11564,
    coords = {0.318, 0.502, 1},
    loot = {18507,18502,18503,18505,},
    sections = {
      Spell(19134, {desc = "向附近的敌人发出怒吼，使它们的移动速度提高25%并因恐惧而逃跑，持续6秒。", flag1 = IMPORTANT}), -- Frightening Shout (triggers 29544)
      Spell(22859, {flag1 = HEALER}), -- Mortal Cleave
      Spell(22857, {desc = "立即反击对你进行了近战攻击的敌人，效果持续8秒。", flag1 = DPS}), -- Retaliation
      Spell(8599, {desc = "激怒，物理伤害提高10%和攻击速度提高30%，持续2分钟。", flag1 = ENRAGE}), -- Enrage
      Spell(22860, {so = true, name = "生命值低于50%时召唤劫掠者！", sections = {
        Stage({
          so = true,
          stype = CREATURE,
          creature = 52761,
          display = 10709,
          name = "戈多克劫掠者",
          sections = {
            Spell(15496, {flag1 = TANK}), -- Cleave
            Spell(13737, {flag1 = HEALER}), -- Mortal Strike
            Spell(15572, {flag1 = HEALER}), -- Sunder Armor
          },
        }),
      }}, 1), -- Call Reavers
    },
  },
  {
    name = "戈多克大王",
    desc = "北区的最后一个首领。如果你完成'完美贡品'，",
	--"The last boss in the north wing. In order to complete a Tribute Run, you have to spare Cho'Rush the Observer and then defeat King Gordok. He will turn friendly once the king is defeated, and you speak to him to spawn the Gordok Tribute chest, containing all sort of high quality items.",
    --icon = true,
    creature = 11501,
    display = 11583,
    coords = {0.318, 0.270, 1},
    loot = {18527,18523,18524,19258,18526,18521,18520,18525,18522,18780,18483,18485,18484,18490,},
    sections = {
      Spell(22886, {desc = "对敌人发起冲锋，将其击退并造成普通伤害外加300点伤害。", flag1 = IMPORTANT}), -- Berserker Charge
      Spell(16856, {flag1 = HEALER}), -- Mortal Strike
      Spell(15572, {flag1 = HEALER}), -- Sunder Armor
      Spell(16727), -- War Stomp
      Stage({
        so = true,
        stype = CREATURE,
        creature = 14324,
        display = 11537,
        name = "观察者克鲁什",
        desc = "他会扮演多个角色并使用不同的法术。",
        sections = {
          Stage({
            icon = "Interface\\Icons\\INV_Staff_13",
            name = "法师",
            sections = {
              Spell(12466, {desc = "对一个敌人造成99到116点火焰伤害。"}), -- Fireball
              Spell(15531, {desc = "对附近的敌人造成99到116点冰霜伤害并将其冻结在原地，冻结效果最多可持续8秒。", flag1 = MAGIC}), -- Frost Nova
              Spell(33860, {desc = "制造一次以施法者为中心的魔法爆炸，对附近的敌人造成奥术伤害。"}), -- Arcane Explosion
            },
          }),
          Stage({
            icon = "Interface\\Icons\\Inv_Staff_30",
            name = "牧师",
            sections = {
              Spell(15587, {desc = "对一个敌人造成49到58点暗影伤害。"}), -- Mind Blast
              Spell(22884, {flag1 = MAGIC}), -- Psychic Scream
              Spell(17139, {desc = "为盟友加上护盾，吸收274点伤害，最多持续30秒。", flag1 = MAGIC}), -- Power Word: Shield
              Spell(38209, {desc = "使用神圣的力量治疗盟友，回复326到379点生命值。", flag1 = INTERRUPT}), -- Heal
            },
          }),
          Stage({
            icon = "Interface\\Icons\\Spell_Nature_Bloodlust",
            name = "萨满",
            sections = {
              Spell(15801, {desc = "用闪电攻击目标，对其造成99到116点自然伤害。"}), -- Lightning Bolt
              Spell(16006, {desc = "向敌人射出一支闪电箭，这支闪电箭会在击中目标后继续攻击它周围最近的敌人，对每个目标都造成99到116点自然伤害，最多可攻击3个目标。"}), -- Chain Lightning
              Spell(15982, {desc = "使用自然的力量治疗盟友，回复319到370点生命值。", flag1 = INTERRUPT}), -- Healing Wave
              Spell(16170, {desc = "使一个友方玩家的攻击速度提高60%，持续30秒。", flag1 = MAGIC}), -- Bloodlust
              --Spell(8376), -- Earthgrab Totem
              Stage({
                so = true,
                stype = CREATURE,
                creature = 6066,
                display = 2420,
                name = "陷地图腾",
                desc = "召唤陷地图腾，持续30秒。",
                sections = {
                  Spell(8377, {so = true}), -- Earthgrab
                },
              }),
            },
          }),
        },
      }),
    },
  },
  {
    name = "卡雷迪斯镇长",
    desc = "镇长是西区的第一个BOSS。For a more optimal path, you should head over to him by running to one of the side paths and saving Tendris Warpwood for later. 记住杀掉所有法力残渣和奥术畸变以破坏水晶塔，还有在巡逻的埃隆巴克保护者。",--路线没翻 看不懂
    --icon = true,
    creature = 11487,
    display = 14384,
    coords = {0.337, 0.448, 3},
    loot = {18350,18397,18374,18351,18371,},
    sections = {
      Spell(22917, {desc = "他的暗影形态使他造成的暗影伤害提高40%，受到近战攻击时承受的伤害降低40%。"}), -- Shadowform
      Spell(7645, {desc = "控制一个敌对人型生物，持续10秒。使其攻击间隔延长100%。", flag1 = MAGIC}), -- Dominate Mind
      Spell(15654, {desc = "黑暗的咒语，每3秒对敌人造成一次暗影伤害，持续15秒。", flag1 = MAGIC}), -- Shadow Word: Pain
      Spell(22919, {desc = "对最多3个敌人造成每秒160点暗影伤害，并使其移动速度降低50%，持续3秒。"}), -- Mind Flay
      Spell(15587, {desc = "对目标造成暗影伤害。"}), -- Mind Blast
    },
  },
  {
    name = "伊琳娜·暗木",
    desc = "击败卡雷迪斯镇长之后，沿斜坡向前来到上层。破坏路上的两个水晶塔之后你就会遇到伊琳娜·暗木和她的宠物。不论你的等级是多少，只要离她60码她都会进入战斗。",
    --icon = true,
    creature = 11488,
    display = 11270,
    coords = {0.208, 0.782, 2},
    loot = {18386,18349,18383,18347,},
    sections = {
      Spell(22910, {desc = "放置一个火焰陷阱，在第一个敌人接近时会对其进行灼烧，在随后的15秒内造成火焰伤害。陷阱可存在1分钟。", flag1 = MAGIC}), -- Immolation Trap (triggers 78578)
      Spell(22914, {desc = "钉刺目标，使其移动速度降低50%，持续3秒。", flag1 = MAGIC}), -- Concussive Shot (triggers 22915)
      Spell(20735), -- Multi-Shot
      Spell(30933), -- Volley
      Stage({
        so = true,
        stype = CREATURE,
        creature = 14308,
        display = 1083,
        name = "费拉",
        sections = {
          Spell(22911, {desc = "向敌人冲锋，造成75%武器伤害并使其昏迷2秒。"}), -- Charge
          Spell(17156, {desc = "下一次攻击的伤害提高10%。"}), -- Maul
        },
      }),
    },
  },
  {
    name = "特迪斯·扭木",
    desc = "与扭木开战后，剩余的埃隆巴克保护者会过来帮助扭木。",
    --icon = true,
    creature = 11489,
    display = 14383,
    coords = {0.332, 0.534, 2},
    loot = {18390,18353,18352,18393,},
    sections = {
      Spell(22994, {so = true, desc = "用根须将敌人缠住，每3秒对其造成4点自然伤害，并使其无法移动，最多持续10秒。"}), -- Entangle
      Spell(22924, {so = true, desc = "对附近的敌人造成263到337点物理伤害，将它们击倒并使其无法移动，持续10秒。", flag1 = MAGIC}), -- Grasping Vines
      Spell(5568, {so = true, desc = "对附近的敌人造成108%武器伤害。"}), -- Trample
    },
  },
  {
    name = "伊莫塔尔",
    desc = "你需要破坏全部五个水晶塔才能与伊莫塔尔战斗。其中两个水晶塔在它房间周围，两个在上层，还有一个在地下城门口的大厅中央。",
    --icon = true,
    creature = 11496,
    display = 14173,
    coords = {0.348, 0.573, 4},
    loot = {18370,18384,18389,18379,18391,18372,18385,18377,18394,18381,},
    sections = {
      Spell(16128, {desc = "每3秒对一名敌人造成13点自然伤害，并使其承受的物理伤害提高20点，持续15秒。", flag1 = DISEASE}), -- Infected Bite
      Spell(5568, {desc = "对附近的敌人造成108%武器伤害"}), -- Trample
      Spell(8269, {desc = "血量低于20%时狂化，增加60%攻击速度，持续两分钟。"}), -- Frenzy
      Spell(22950, {desc = "将随机一个敌人传送到它面前。"}), -- Portal of Immol'thar
      --Spell(22899, {desc = "Periodically summons an Eye of Immol'thar."}), -- Eye of Immol'thar
      Stage({
        so = true,
        stype = CREATURE,
        creature = 14396,
        display = 14430,
        name = "伊莫塔尔之眼",
        --desc = "If left alive for too long, Immol'thar will be healed.",
        sections = {
          Spell(22909), -- Eye of Immol'thar
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 11466,
        display = 11207,
        name = "上层精灵召唤者",
        sections = {
          Spell(9053, {desc = "对敌人造成49到58点火焰伤害。"}), -- Fireball
          Spell(13339, {desc = "对敌人造成24到29点火焰伤害。"}), -- Fire Blast
          Spell(11831, {desc = "对附近的敌人造成24到29点冰霜伤害并将其冻结在原地，冻结效果最多可持续6秒。", flag1 = MAGIC}), -- Frost Nova
        },
      }),
    },
  },
  {
    name = "托塞德林王子",
    desc = "西区的最终BOSS。你必须击败伊莫塔尔才能见到他。",
    --icon = true,
    creature = 11486,
    display = 11256,
    coords = {0.621, 0.233, 4},
    loot = {18380,18375,18376,18373,18378,18396,18382,18388,18392,18395,},
    sections = {
      Spell(22920, {so = true}), -- Arcane Blast
      Spell(20537, {so = true, desc = "反制敌人的法术，使其在15秒内无法施放该法术。", flag1 = IMPORTANT}), -- Counterspell
      Spell(15589, {so = true, desc = "像旋风一般挥舞手中的武器，造成普通伤害再加上300点额外伤害。", flag1 = DPS}), -- Whirlwind
      Spell(3391, {so = true}), -- Thrash
      --Spell(22995), -- Summon
    },
  },
})

table.insert(db, DIRE_MAUL)
