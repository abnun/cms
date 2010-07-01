package de.webmpuls.cms.section
/**
 * User: markus.mueller (markus2.mueller@bechtle.com)
 * Date: 04.03.2010
 * Time: 16:59:27
 */
public class AbteilungHelper 
{
	public AbteilungHelper()
	{
		if(!initialized)
		{
			initAbteilung_Kuerzel_To_Remote_Identifier_Map()
		}
	}

	// Codes
	static final String CODE_ABTEILUNGEN = "abteilung"
	static final String CODE_BADMINTON = "badminton"
	static final String CODE_BASKETBALL = "basketball"
	static final String CODE_FUSSBALL_AH = "fussball_-_ah"
	static final String CODE_FUSSBALL_DAMEN = "fussball_-_damen"

	// Herren
	static final String CODE_FUSSBALL_HERREN = "fussball_-_herren"
	static final String CODE_FUSSBALL_HERREN_1_MANNSCHAFT = "fussball_-_herren_1_mannschaft"
	static final String CODE_FUSSBALL_HERREN_2_MANNSCHAFT = "fussball_-_herren_2_mannschaft"

	// Jugend
	static final String CODE_FUSSBALL_JUGEND = "fussball_-_jugend"

	// Jugend Kinderfussball (m/w)

	// Bambini
	static final String CODE_FUSSBALL_JUGEND_BAMBINI = "fussball_-_jugend_-_bambini"

	// F
	static final String CODE_FUSSBALL_JUGEND_M_W_F_1 = "fussball_-_jugend_m_w_f_1"
	static final String CODE_FUSSBALL_JUGEND_M_W_F_2 = "fussball_-_jugend_m_w_f_2"
	static final String CODE_FUSSBALL_JUGEND_M_W_F_3 = "fussball_-_jugend_m_w_f_3"

	// E
	static final String CODE_FUSSBALL_JUGEND_M_W_E_1 = "fussball_-_jugend_m_w_e_1"
	static final String CODE_FUSSBALL_JUGEND_M_W_E_2 = "fussball_-_jugend_m_w_e_2"

	// Jugend Jungs

	// D
	static final String CODE_FUSSBALL_JUGEND_M_D_1 = "fussball_-_jugend_m_d_1"
	static final String CODE_FUSSBALL_JUGEND_M_D_2 = "fussball_-_jugend_m_d_2"

	// C
	static final String CODE_FUSSBALL_JUGEND_M_C_1 = "fussball_-_jugend_m_c_1"
	static final String CODE_FUSSBALL_JUGEND_M_C_2 = "fussball_-_jugend_m_c_2"
	static final String CODE_FUSSBALL_JUGEND_M_C_3 = "fussball_-_jugend_m_c_3"

	// B
	static final String CODE_FUSSBALL_JUGEND_M_B = "fussball_-_jugend_m_b"

	// A
	static final String CODE_FUSSBALL_JUGEND_M_A = "fussball_-_jugend_m_a"


	// Jugend Maedchen

	// E
	static final String CODE_FUSSBALL_JUGEND_F_E = "fussball_-_jugend_f_e"

	// D
	static final String CODE_FUSSBALL_JUGEND_F_D = "fussball_-_jugend_f_d"

	// C
	static final String CODE_FUSSBALL_JUGEND_F_C_1 = "fussball_-_jugend_f_c_1"
	static final String CODE_FUSSBALL_JUGEND_F_C_2 = "fussball_-_jugend_f_c_2"

	// B
	static final String CODE_FUSSBALL_JUGEND_F_B = "fussball_-_jugend_f_b"

	// A
	static final String CODE_FUSSBALL_JUGEND_F_A = "fussball_-_jugend_f_a"


	// Handball
	static final String CODE_HANDBALL = "handball"
	static final String CODE_KARATE = "karate"
	static final String CODE_LEICHTATHLETIK = "leichtathletik"
	static final String CODE_RADSPORT = "radsport"
	static final String CODE_REITEN = "reiten"
	static final String CODE_SCHACH = "schach"
	static final String CODE_SKI = "ski"
	static final String CODE_TANZEN = "tanzen"
	static final String CODE_TENNIS = "tennis"
	static final String CODE_TISCHTENNIS = "tischtennis"
	static final String CODE_TURNEN = "turnen"
	static final String CODE_VOLLEYBALL = "volleyball"


	// Names
	static final String NAME_BADMINTON = "Badminton"
	static final String NAME_BASKETBALL = "Basketball"
	static final String NAME_FUSSBALL_AH = "Fußball - AH"
	static final String NAME_FUSSBALL_DAMEN = "Fußball - Damen"

	// Herren
	static final String NAME_FUSSBALL_HERREN = "Fußball - Herren"
	static final String NAME_FUSSBALL_HERREN_1_MANNSCHAFT = "SV Leingarten"
	static final String NAME_FUSSBALL_HERREN_2_MANNSCHAFT = "SV Leingarten II"

	// Jugend
	static final String NAME_FUSSBALL_JUGEND = "Fußball - Jugend"

	// Jugend Kinderfussball (m/w)

	// Bambini
	static final String NAME_FUSSBALL_JUGEND_BAMBINI = "Bambini"

	// F
	static final String NAME_FUSSBALL_JUGEND_M_W_F_1 = "SV Leingarten"
	static final String NAME_FUSSBALL_JUGEND_M_W_F_2 = "SV Leingarten"
	static final String NAME_FUSSBALL_JUGEND_M_W_F_3 = "SV Leingarten"

	// E
	static final String NAME_FUSSBALL_JUGEND_M_W_E_1 = "SV Leingarten I"
	static final String NAME_FUSSBALL_JUGEND_M_W_E_2 = "SV Leingarten II"

	// Jugend Jungs
	
	// D
	static final String NAME_FUSSBALL_JUGEND_M_D_1 = "SV Leingarten I"
	static final String NAME_FUSSBALL_JUGEND_M_D_2 = "SV Leingarten II"

	// C
	static final String NAME_FUSSBALL_JUGEND_M_C_1 = "SV Leingarten I"
	static final String NAME_FUSSBALL_JUGEND_M_C_2 = "SV Leingarten II"
	static final String NAME_FUSSBALL_JUGEND_M_C_3 = "SV Leingarten III"

	// B
	static final String NAME_FUSSBALL_JUGEND_M_B = "SV Leingarten"

	// A
	static final String NAME_FUSSBALL_JUGEND_M_A = "SV Leingarten"


	// Jugend Maedchen

	// E
	static final String NAME_FUSSBALL_JUGEND_F_E = "SV Leingarten"

	// D
	static final String NAME_FUSSBALL_JUGEND_F_D = "SV Leingarten"

	// C
	static final String NAME_FUSSBALL_JUGEND_F_C_1 = "SV Leingarten I"
	static final String NAME_FUSSBALL_JUGEND_F_C_2 = "SV Leingarten II"

	// B
	static final String NAME_FUSSBALL_JUGEND_F_B = "SV Leingarten"

	// A
	static final String NAME_FUSSBALL_JUGEND_F_A = "SV Leingarten"


	// Handball
	static final String NAME_HANDBALL = "Handball"
	static final String NAME_KARATE = "Karate"
	static final String NAME_LEICHTATHLETIK = "Leichtathletik"
	static final String NAME_RADSPORT = "Radsport"
	static final String NAME_REITEN = "Reiten"
	static final String NAME_SCHACH = "Schach"
	static final String NAME_SKI = "Ski"
	static final String NAME_TANZEN = "Tanzen"
	static final String NAME_TENNIS = "Tennis"
	static final String NAME_TISCHTENNIS = "Tischtennis"
	static final String NAME_TURNEN = "Turnen"
	static final String NAME_VOLLEYBALL = "Volleyball"

	// Tokens
	static final String TOKEN_BADMINTON = "BM"
	static final String TOKEN_BASKETBALL = "BB"
	static final String TOKEN_FUSSBALL_AH = "F_AH"

	// Frauen
	static final String TOKEN_FUSSBALL_DAMEN = "F_D"

	// Herren
	static final String TOKEN_FUSSBALL_HERREN_1_MANNSCHAFT = "F_H1"
	static final String TOKEN_FUSSBALL_HERREN_2_MANNSCHAFT = "F_H2"

	// Jugend Kinderfussball (m/w)

	// Bambini

	static final String TOKEN_FUSSBALL_JUGEND_BAMBINI = "Bamb-m/w"

	// F
	static final String TOKEN_FUSSBALL_JUGEND_M_W_F_1 = "F1-m/w"
	static final String TOKEN_FUSSBALL_JUGEND_M_W_F_2 = "F2-m/w"
	static final String TOKEN_FUSSBALL_JUGEND_M_W_F_3 = "F3-m/w"

	// E
	static final String TOKEN_FUSSBALL_JUGEND_M_W_E_1 = "E1-m/w"
	static final String TOKEN_FUSSBALL_JUGEND_M_W_E_2 = "E2-m/w"

	// Jugend Jungs

	// D
	static final String TOKEN_FUSSBALL_JUGEND_M_D_1 = "D1-m"
	static final String TOKEN_FUSSBALL_JUGEND_M_D_2 = "D2-m"

	// C
	static final String TOKEN_FUSSBALL_JUGEND_M_C_1 = "C1-m-SGM"
	static final String TOKEN_FUSSBALL_JUGEND_M_C_2 = "C2-m-SGM"
	static final String TOKEN_FUSSBALL_JUGEND_M_C_3 = "C3-m-SGM"

	// B
	static final String TOKEN_FUSSBALL_JUGEND_M_B = "B-m-SGM"

	// A
	static final String TOKEN_FUSSBALL_JUGEND_M_A = "A-m"

	
	// Jugend Maedchen

	// E
	static final String TOKEN_FUSSBALL_JUGEND_F_E =  "E-w"

	// D
	static final String TOKEN_FUSSBALL_JUGEND_F_D = "D-w-SGM"

	// C
	static final String TOKEN_FUSSBALL_JUGEND_F_C_1 = "C1-w-SGM"
	static final String TOKEN_FUSSBALL_JUGEND_F_C_2 = "C2-w-SGM"

	// B
	static final String TOKEN_FUSSBALL_JUGEND_F_B = "B-w"

	// A
	static final String TOKEN_FUSSBALL_JUGEND_F_A = "A-w"

	// Handball
	static final String TOKEN_HANDBALL = "Handball"

	static final String TOKEN_KARATE = "Karate"
	static final String TOKEN_LEICHTATHLETIK = "Leichtathletik"
	static final String TOKEN_RADSPORT = "Radsport"
	static final String TOKEN_REITEN = "Reiten"
	static final String TOKEN_SCHACH = "Schach"
	static final String TOKEN_SKI = "Ski"
	static final String TOKEN_TANZEN = "Tanzen"
	static final String TOKEN_TENNIS = "Tennis"
	static final String TOKEN_TISCHTENNIS = "Tischtennis"
	static final String TOKEN_TURNEN = "Turnen"

	// Volleyball
	static final String TOKEN_VOLLEYBALL = "Volleyball"


	public Map ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP = new HashMap()
	boolean initialized = false;

	public static String formatNameToCode(String value, String tmpCode)
	{
		if(value)
		{
			value = value.toLowerCase()
			tmpCode = value
			if (value.contains(" "))
			{
				tmpCode = tmpCode.replaceAll(" ", "_")
			}
			if (value.contains("."))
			{
				tmpCode = tmpCode.replaceAll(".", "")
			}
			if (value.contains("/"))
			{
				tmpCode = tmpCode.replaceAll("/", "_")
			}
			if (value.contains("("))
			{
				tmpCode = tmpCode.replaceAll("\\(", "")
			}
			if (value.contains(")"))
			{
				tmpCode = tmpCode.replaceAll("\\)", "")
			}
			if (value.contains("ß"))
			{
				tmpCode = tmpCode.replaceAll("ß", "ss")
			}
			if (value.contains("ä"))
			{
				tmpCode = tmpCode.replaceAll("ä", "ae")
			}
			if (value.contains("ü"))
			{
				tmpCode = tmpCode.replaceAll("ü", "ue")
			}
			if (value.contains("ö"))
			{
				tmpCode = tmpCode.replaceAll('ö', "oe")
			}
		}

		return tmpCode
	}

	public void initAbteilung_Kuerzel_To_Remote_Identifier_Map()
	{
		if(!initialized)
		{
			initialized = true
		}

		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_DAMEN, "Frauen Bezirksliga")

		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_HERREN_1_MANNSCHAFT, "Kreisliga A")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_HERREN_2_MANNSCHAFT, "Kreisliga B")

		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_BAMBINI, "Bambini")
		//ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_F_A, "A-Junioren Bezirksstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_F_B, "B-Juniorinnen Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_F_C_1, "C-Juniorinnen Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_F_C_2, "C-Juniorinnen Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_F_D, "D-Juniorinnen Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_F_E, "E-Juniorinnen Kreisstaffel")

		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_A, "A-Junioren Bezirksstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_B, "B-Junioren Bezirksstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_C_1, "C-Junioren Bezirksstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_C_2, "C-Junioren Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_C_3, "C-Junioren Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_D_1, "D-Junioren Leistungsstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_D_2, "D-Junioren Kreisstaffel")
	}
}