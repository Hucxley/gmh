# -*- coding: utf-8 -*-
require 'spec_helper'

describe Monster do

  describe "parse_from_google_html" do
    it "should parse name from google html" do
      monster = Monster.parse_from_google_html(@sample)
      monster.name.should == "Blink Dog"
    end

    it "should parse name from google html" do
      monster = Monster.parse_from_google_html(@sample)
      monster.initiative.should == 3
    end
  end

  before do
    @sample = <<HTML
<html>
  <body>
    <p>
      <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="5">BLINK DOG</font></span>
    </p>
    <table>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">&nbsp;</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Medium Magical Beast</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Hit Dice:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">4d10 (22 hp)</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Initiative:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">+3</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Speed:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">40 ft. (8 squares)</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Armor Class:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">16 (+3 Dex, +3 natural), touch 13, flat-footed 13</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Base Attack/Grapple:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">+4/+4</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Attack:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Bite +4 melee (1d6)</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Full Attack:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Bite +4 melee (1d6)</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Space/Reach:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">5 ft./5 ft.</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Special Attacks:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">—</font></b></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Special Qualities:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Blink, darkvision 60 ft., dimension door, low-light vision, scent</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Saves:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Fort +4, Ref +7, Will +4</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Abilities:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Str 10, Dex 17, Con 10, Int 10, Wis 13, Cha 11</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Skills:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Hide +3, Listen +5, Sense Motive +3, Spot +5, Survival +4</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Feats:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Iron Will, Run, Track</font></span><span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><sup><font size="1">B</font></sup></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Environment:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Temperate plains</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Organization:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Solitary, pair, or pack (7–16)</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Challenge Rating:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">2</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Treasure:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">None</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Alignment:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Usually lawful good</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Advancement:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">5–7 HD (Medium); 8–12 HD (Large)</font></span>
	  </p>
	</td>
      </tr>
      <tr>
	<td style=" VERTICAL-ALIGN:top">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Level Adjustment:</font></b></span>
	  </p>
	</td>
	<td style=" VERTICAL-ALIGN:top; WIDTH:216.55pt">
	  <p>
	    <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">+2 (cohort)</font></span>
	  </p>
	</td>
      </tr>
    </table>
    <p>
      <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">The blink dog is an intelligent canine that has a limited teleportation ability.</font></span>
    </p>
    <p>
      <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Blink dogs have their own language, a mixture of barks, yaps, whines, and growls that can transmit complex information.</font></span>
    </p>
    <p>
      <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="3">COMBAT</font></span>
    </p>
    <p>
      <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">Blink dogs hunt in packs, teleporting in a seemingly random fashion until they surround their prey, allowing some of them to take advantage of flanking.</font></span>
    </p>
    <p>
      <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Blink (Su): </font></b></span><span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">A blink dog can use </font></span><span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><i><font size="2">blink </font></i></span><span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">as the spell (caster level 8th), and can evoke or end the effect as a free action.</font></span>
    </p>
    <p>
      <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><b><font size="2">Dimension Door (Su):</font></b></span><span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2"> A blink dog can teleport, as </font></span><span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><i><font size="2">dimension door </font></i></span><span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="2">(caster level 8th), once per round as a free action. The ability affects only the blink dog, which never appears within a solid object and can act immediately after teleporting.</font>
    </span>
    </p>
    <p>
      <span style="COLOR:#000000; FONT-FAMILY:'Times New Roman'"><font size="5">&nbsp;</font></span>
    </p>
  </body>
</html>
HTML
  end
end
