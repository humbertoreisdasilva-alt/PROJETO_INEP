create or replace view VW_CURSOS_SP_PRIVADA_2015_2024_ML(
	ANO_CENSO,
	COD_IES,
	NOME_IES,
	SIGLA_IES,
	ORGANIZACAO_ACADEMICA,
	COD_REDE,
	COD_CURSO,
	NOME_CURSO,
	COD_MUNICIPIO,
	NOME_MUNICIPIO_CURSO,
	SIGLA_UF_CURSO,
	COD_CINE,
	NOME_AREA_GERAL_CINE,
	MODALIDADE_ENSINO,
	GRAU_ACADEMICO,
	QTD_CURSOS,
	QTD_VAGAS_TOTAL,
	QTD_VAGAS_NOVAS,
	QTD_INSCRICOES_VAGAS_NOVAS,
	QTD_INGRESSANTES_TOTAL,
	QTD_INGRESSANTES_VAGAS_NOVAS,
	QTD_INGRESSANTES_FEMININO,
	QTD_INGRESSANTES_MASCULINO,
	QTD_CONCLUINTES,
	QTD_FIES,
	QTD_PROUNI,
	QTD_FINANCIAMENTO
) as

SELECT

    /* ============================================================
       1. TEMPO
       ============================================================ */

    TRY_TO_NUMBER(ANO_CENSO)                            AS ANO_CENSO,


    /* ============================================================
       2. INSTITUIÇÃO DE ENSINO SUPERIOR
       ============================================================ */

    TRY_TO_NUMBER(CO_IES)                               AS COD_IES,

    NULLIF(TRIM(NO_IES), '')                            AS NOME_IES,

    NULLIF(TRIM(SG_IES), '')                            AS SIGLA_IES,

    TRY_TO_NUMBER(TP_ORGANIZACAO_ACADEMICA)             AS ORGANIZACAO_ACADEMICA,

    TRY_TO_NUMBER(TP_REDE)                              AS COD_REDE,


    /* ============================================================
       3. CURSO
       ============================================================ */

    TRY_TO_NUMBER(CO_CURSO)                             AS COD_CURSO,

    NULLIF(TRIM(NO_CURSO), '')                          AS NOME_CURSO,


    /* ============================================================
       4. LOCALIZAÇÃO DO CURSO
       ============================================================ */

    TRY_TO_NUMBER(CO_MUNICIPIO_CURSO)                   AS COD_MUNICIPIO,

    NULLIF(TRIM(NO_MUNICIPIO_CURSO), '')                AS NOME_MUNICIPIO_CURSO,

    UPPER(
        NULLIF(
            TRIM(SG_UF_CURSO),
            ''
        )
    )                                                   AS SIGLA_UF_CURSO,


    /* ============================================================
       5. CLASSIFICAÇÃO CINE
       ============================================================ */

    NULLIF(
        TRIM(CO_CINE_AREA_GERAL),
        ''
    )                                                   AS COD_CINE,

    NULLIF(
        TRIM(NO_CINE_AREA_GERAL),
        ''
    )                                                   AS NOME_AREA_GERAL_CINE,


    /* ============================================================
       6. MODALIDADE / GRAU
       ============================================================ */

    NULLIF(
        TRIM(MODALIDADE_ENSINO),
        ''
    )                                                   AS MODALIDADE_ENSINO,

    TRY_TO_NUMBER(TP_GRAU_ACADEMICO)                    AS GRAU_ACADEMICO,


    /* ============================================================
       7. QUANTIDADE DE CURSOS
       ============================================================ */

    COALESCE(
        TRY_TO_NUMBER(QT_CURSO),
        0
    )                                                   AS QTD_CURSOS,


    /* ============================================================
       8. VAGAS
       ============================================================ */

    COALESCE(
        TRY_TO_NUMBER(QT_VG_TOTAL),
        0
    )                                                   AS QTD_VAGAS_TOTAL,

    COALESCE(
        TRY_TO_NUMBER(QT_VG_NOVA),
        0
    )                                                   AS QTD_VAGAS_NOVAS,


    /* ============================================================
       9. INSCRIÇÕES
       ============================================================ */

    COALESCE(
        TRY_TO_NUMBER(QT_INSC_VG_NOVA),
        0
    )                                                   AS QTD_INSCRICOES_VAGAS_NOVAS,


    /* ============================================================
       10. INGRESSANTES
       ============================================================ */

    COALESCE(
        TRY_TO_NUMBER(QT_ING),
        0
    )                                                   AS QTD_INGRESSANTES_TOTAL,

    COALESCE(
        TRY_TO_NUMBER(QT_ING_VG_NOVA),
        0
    )                                                   AS QTD_INGRESSANTES_VAGAS_NOVAS,

    COALESCE(
        TRY_TO_NUMBER(QT_ING_FEM),
        0
    )                                                   AS QTD_INGRESSANTES_FEMININO,

    COALESCE(
        TRY_TO_NUMBER(QT_ING_MASC),
        0
    )                                                   AS QTD_INGRESSANTES_MASCULINO,


    /* ============================================================
       11. CONCLUINTES
       ============================================================ */

    COALESCE(
        TRY_TO_NUMBER(QT_CONC),
        0
    )                                                   AS QTD_CONCLUINTES,


    /* ============================================================
       12. FINANCIAMENTO
       ============================================================ */

    COALESCE(
        TRY_TO_NUMBER(QT_ING_FIES),
        0
    )                                                   AS QTD_FIES,


    /* PROUNI = integral + parcial */

    COALESCE(
        TRY_TO_NUMBER(QT_ING_PROUNII),
        0
    )
    +
    COALESCE(
        TRY_TO_NUMBER(QT_ING_PROUNIP),
        0
    )                                                   AS QTD_PROUNI,


    COALESCE(
        TRY_TO_NUMBER(QT_ING_FINANC),
        0
    )                                                   AS QTD_FINANCIAMENTO


FROM PROJETO_INEP.ANALYTICS.VW_BI_ML_CURSOS


/* ==============================================================
   13. RECORTE DE NEGÓCIO
   ============================================================== */

WHERE

    TRY_TO_NUMBER(ANO_CENSO)
        BETWEEN 2015 AND 2024

    /* Rede privada */
    AND TRY_TO_NUMBER(TP_REDE) = 2

    /* Curso ofertado no Estado de São Paulo */
    AND TRY_TO_NUMBER(CO_UF_CURSO) = 35;