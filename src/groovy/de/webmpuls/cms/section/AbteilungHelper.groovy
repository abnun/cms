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
	static final String CODE_ABTEILUNGEN = "abteilungen"
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

	// Jugend Jungs

	// Bambini
	static final String CODE_FUSSBALL_JUGEND_BAMBINI = "fussball_-_jugend_-_bambini"

	// F
	static final String CODE_FUSSBALL_JUGEND_M_F = "fussball_-_jugend_m_f"

	// E
	static final String CODE_FUSSBALL_JUGEND_M_E_1 = "fussball_-_jugend_m_e_1"
	static final String CODE_FUSSBALL_JUGEND_M_E_2 = "fussball_-_jugend_m_e_2"

	// D
	static final String CODE_FUSSBALL_JUGEND_M_D_1 = "fussball_-_jugend_m_d_1"
	static final String CODE_FUSSBALL_JUGEND_M_D_2 = "fussball_-_jugend_m_d_2"
	static final String CODE_FUSSBALL_JUGEND_M_D_3 = "fussball_-_jugend_m_d_3"

	// C
	static final String CODE_FUSSBALL_JUGEND_M_C_1 = "fussball_-_jugend_m_c_1"
	static final String CODE_FUSSBALL_JUGEND_M_C_2 = "fussball_-_jugend_m_c_2"

	// B
	static final String CODE_FUSSBALL_JUGEND_M_B = "fussball_-_jugend_m_b"

	// A
	static final String CODE_FUSSBALL_JUGEND_M_A = "fussball_-_jugend_m_a"


	// Jugend Maedchen

	// D
	static final String CODE_FUSSBALL_JUGEND_F_D_1 = "fussball_-_jugend_f_d_1"
	static final String CODE_FUSSBALL_JUGEND_F_D_2 = "fussball_-_jugend_f_d_2"

	// C
	static final String CODE_FUSSBALL_JUGEND_F_C = "fussball_-_jugend_f_c"

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

	// Jugend Jungs

	// Bambini
	static final String NAME_FUSSBALL_JUGEND_BAMBINI = "Bambini"

	// F
	static final String NAME_FUSSBALL_JUGEND_M_F = "SV Leingarten"

	// E
	static final String NAME_FUSSBALL_JUGEND_M_E_1 = "SV Leingarten I"
	static final String NAME_FUSSBALL_JUGEND_M_E_2 = "SV Leingarten II"

	// D
	static final String NAME_FUSSBALL_JUGEND_M_D_1 = "SV Leingarten I"
	static final String NAME_FUSSBALL_JUGEND_M_D_2 = "SV Leingarten II"
	static final String NAME_FUSSBALL_JUGEND_M_D_3 = "SV Leingarten III"

	// C
	static final String NAME_FUSSBALL_JUGEND_M_C_1 = "SV Leingarten I"
	static final String NAME_FUSSBALL_JUGEND_M_C_2 = "SV Leingarten II"

	// B
	static final String NAME_FUSSBALL_JUGEND_M_B = "SV Leingarten"

	// A
	static final String NAME_FUSSBALL_JUGEND_M_A = "SV Leingarten"


	// Jugend Maedchen

	// D
	static final String NAME_FUSSBALL_JUGEND_F_D_1 = "SV Leingarten I"
	static final String NAME_FUSSBALL_JUGEND_F_D_2 = "SV Leingarten II"

	// C
	static final String NAME_FUSSBALL_JUGEND_F_C = "SV Leingarten"

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

	// Jugend Jungs

	// Bambini
	static final String TOKEN_FUSSBALL_JUGEND_BAMBINI = "F_JBM"

	// F
	static final String TOKEN_FUSSBALL_JUGEND_M_F = "F_JMF"

	// E
	static final String TOKEN_FUSSBALL_JUGEND_M_E_1 = "F_JME1"
	static final String TOKEN_FUSSBALL_JUGEND_M_E_2 = "F_JME2"

	// D
	static final String TOKEN_FUSSBALL_JUGEND_M_D_1 = "F_JMD1"
	static final String TOKEN_FUSSBALL_JUGEND_M_D_2 = "F_JMD2"
	static final String TOKEN_FUSSBALL_JUGEND_M_D_3 = "F_JMD3"

	// C
	static final String TOKEN_FUSSBALL_JUGEND_M_C_1 = "F_JMC1"
	static final String TOKEN_FUSSBALL_JUGEND_M_C_2 = "F_JMC2"

	// B
	static final String TOKEN_FUSSBALL_JUGEND_M_B = "F_JMB"

	// A
	static final String TOKEN_FUSSBALL_JUGEND_M_A = "F_JMA"

	
	// Jugend Maedchen

	// D
	static final String TOKEN_FUSSBALL_JUGEND_F_D_1 = "F_JFD1"
	static final String TOKEN_FUSSBALL_JUGEND_F_D_2 = "F_JFD2"

	// C
	static final String TOKEN_FUSSBALL_JUGEND_F_C = "F_JFC"

	// B
	static final String TOKEN_FUSSBALL_JUGEND_F_B = "F_JFB"

	// A
	static final String TOKEN_FUSSBALL_JUGEND_F_A = "F_JFA"

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
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_F_C, "C-Juniorinnen Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_F_D_1, "D-Juniorinnen Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_F_D_2, "D-Juniorinnen Kreisstaffel")

		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_A, "A-Junioren Bezirksstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_B, "B-Junioren Bezirksstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_C_1, "C-Junioren Bezirksstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_C_2, "C-Junioren Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_D_1, "D-Junioren Leistungsstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_D_2, "D-Junioren Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_D_3, "D-Junioren Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_E_1, "E-Junioren Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_E_2, "E-Junioren Kreisstaffel")
		ABTEILUNG_KUERZEL_TO_REMOTE_IDENTIFIER_MAP.put(TOKEN_FUSSBALL_JUGEND_M_F, "")
	}
}