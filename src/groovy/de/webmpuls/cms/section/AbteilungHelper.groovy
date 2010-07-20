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

	// CODES
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
	static final String CODE_FUSSBALL_JUGEND_M_W = "fussball_-_jugend_m_w"

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
	static final String CODE_FUSSBALL_JUGEND_M = "fussball_-_jugend_m"

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
	static final String CODE_FUSSBALL_JUGEND_F = "fussball_-_jugend_f"

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


	// NAMES
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
	static final String NAME_FUSSBALL_JUGEND_M_W = "SV Leingarten"

	// Bambini
	static final String NAME_FUSSBALL_JUGEND_BAMBINI = "Bambini"

	// F
	static final String NAME_FUSSBALL_JUGEND_M_W_F_1 = "SV Leingarten"
	static final String NAME_FUSSBALL_JUGEND_M_W_F_2 = "SV Leingarten II"
	static final String NAME_FUSSBALL_JUGEND_M_W_F_3 = "SV Leingarten III"

	// E
	static final String NAME_FUSSBALL_JUGEND_M_W_E_1 = "SV Leingarten"
	static final String NAME_FUSSBALL_JUGEND_M_W_E_2 = "SV Leingarten II"

	// Jugend Jungs
	static final String NAME_FUSSBALL_JUGEND_M = "Junioren"
	
	// D
	static final String NAME_FUSSBALL_JUGEND_M_D_1 = "SV Leingarten"
	static final String NAME_FUSSBALL_JUGEND_M_D_2 = "SV Leingarten II"

	// C
	static final String NAME_FUSSBALL_JUGEND_M_C_1 = "SV Leingarten"
	static final String NAME_FUSSBALL_JUGEND_M_C_2 = "SV Leingarten II"
	static final String NAME_FUSSBALL_JUGEND_M_C_3 = "SV Leingarten III"

	// B
	static final String NAME_FUSSBALL_JUGEND_M_B = "SV Leingarten"

	// A
	static final String NAME_FUSSBALL_JUGEND_M_A = "SV Leingarten"


	// Jugend Maedchen
	static final String NAME_FUSSBALL_JUGEND_F = "Juniorinnen"

	// E
	static final String NAME_FUSSBALL_JUGEND_F_E = "SV Leingarten"

	// D
	static final String NAME_FUSSBALL_JUGEND_F_D = "SV Leingarten"

	// C
	static final String NAME_FUSSBALL_JUGEND_F_C_1 = "SV Leingarten"
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

	// DISPLAY NAMES
	static final String DISPLAY_NAME_BADMINTON = "Badminton"
	static final String DISPLAY_NAME_BASKETBALL = "Basketball"
	static final String DISPLAY_NAME_FUSSBALL_AH = "Fußball - AH"
	static final String DISPLAY_NAME_FUSSBALL_DAMEN = "Frauen (ab 1992)"

	// Herren
	static final String DISPLAY_NAME_FUSSBALL_HERREN = "Fußball - Herren"
	static final String DISPLAY_NAME_FUSSBALL_HERREN_1_MANNSCHAFT = "1. Mannschaft"
	static final String DISPLAY_NAME_FUSSBALL_HERREN_2_MANNSCHAFT = "2. Mannschaft"

	// Jugend
	static final String DISPLAY_NAME_FUSSBALL_JUGEND = "Fußball - Jugend"

	// Jugend Kinderfussball (m/w)
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_W = "Kinderfußball (m/w)"

	// Bambini
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_BAMBINI = "Bambini"

	// F
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_W_F_1 = "F-Junioren Gruppe 1"
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_W_F_2 = "F-Junioren Gruppe 2"
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_W_F_3 = "F-Junioren Gruppe 3"

	// E
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_W_E_1 = "E-Junioren Gruppe 1"
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_W_E_2 = "E-Junioren Gruppe 2"

	// Jugend Jungs
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M = "Junioren"

	// D
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_D_1 = "D-Junioren Gruppe 1"
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_D_2 = "D-Junioren Gruppe 2"

	// C
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_C_1 = "C-Junioren Gruppe 1"
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_C_2 = "C-Junioren Gruppe 2"
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_C_3 = "C-Junioren Gruppe 3"

	// B
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_B = "B-Junioren"

	// A
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_M_A = "A-Junioren"


	// Jugend Maedchen
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_F = "Juniorinnen"

	// E
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_F_E = "E-Juniorinnen"

	// D
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_F_D = "D-Juniorinnen"

	// C
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_F_C_1 = "C-Juniorinnen Gruppe 1"
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_F_C_2 = "C-Juniorinnen Gruppe 2"

	// B
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_F_B = "B-Juniorinnen"

	// A
	static final String DISPLAY_NAME_FUSSBALL_JUGEND_F_A = "A-Juniorinnen"


	// Handball
	static final String DISPLAY_NAME_HANDBALL = "Handball"
	static final String DISPLAY_NAME_KARATE = "Karate"
	static final String DISPLAY_NAME_LEICHTATHLETIK = "Leichtathletik"
	static final String DISPLAY_NAME_RADSPORT = "Radsport"
	static final String DISPLAY_NAME_REITEN = "Reiten"
	static final String DISPLAY_NAME_SCHACH = "Schach"
	static final String DISPLAY_NAME_SKI = "Ski"
	static final String DISPLAY_NAME_TANZEN = "Tanzen"
	static final String DISPLAY_NAME_TENNIS = "Tennis"
	static final String DISPLAY_NAME_TISCHTENNIS = "Tischtennis"
	static final String DISPLAY_NAME_TURNEN = "Turnen"
	static final String DISPLAY_NAME_VOLLEYBALL = "Volleyball"

	// TOKENS
	static final String TOKEN_BADMINTON = "BM"
	static final String TOKEN_BASKETBALL = "BB"
	static final String TOKEN_FUSSBALL_AH = "F_AH"

	// Frauen
	static final String TOKEN_FUSSBALL_DAMEN = "F_D"

	// Herren
	static final String TOKEN_FUSSBALL_HERREN_1_MANNSCHAFT = "F_H1"
	static final String TOKEN_FUSSBALL_HERREN_2_MANNSCHAFT = "F_H2"

	// Jugend Kinderfussball (m/w)
	static final String TOKEN_FUSSBALL_JUGEND_M_W = "F_J-m/w"

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
	static final String TOKEN_FUSSBALL_JUGEND_M = "F_J-m"

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
	static final String TOKEN_FUSSBALL_JUGEND_F =  "F_J-w"

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

	// Muss geaendert werden, wenn die Staffel sich aendert
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