SELECT 
    CONCAT(PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[codigoUnidGestora],
		PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[anoReferencia],
		prestacaocontas.[CadastrosAuxiliares].[PrestacaoContas].[mesReferencia]) as id,
    PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[codigoUnidGestora] as codigoUnidGestora,
    PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[nomeUnidGestora] as nomeUnidGestora,
    PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[cpfContador] as cpfContador,
    PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[cpfGestor] as cpfGestor,
    PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[anoReferencia] as anoReferencia,
    PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[mesReferencia] as mesReferencia,
    PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[versaoXml] as versaoXml,
    PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[diaInicPresContas] as diaInicPresContas,
    PrestacaoContas.[CadastrosAuxiliares].[PrestacaoContas].[diaFinaPresContas] as diaFinaPresContas
INTO
    [tb-prestacaocontas]
FROM
    [cadastrosauxiliares] PrestacaoContas


	
SELECT 
	Orcamento.[CadastrosAuxiliares].[orcamento].[anoVigeLoa] as id,
	CONCAT(
		Orcamento.[CadastrosAuxiliares].[PrestacaoContas].[codigoUnidGestora],
		Orcamento.[CadastrosAuxiliares].[PrestacaoContas].[anoReferencia],
		Orcamento.[CadastrosAuxiliares].[PrestacaoContas].[mesReferencia]
	) as id_prestacaocontas,
    Orcamento.[CadastrosAuxiliares].[Orcamento].[anoVigeLoa] as anoVigeLoa,
    Orcamento.[CadastrosAuxiliares].[Orcamento].[dataPublLoa] as dataPublLoa,
    Orcamento.[CadastrosAuxiliares].[Orcamento].[percentualAutoSuplLoa] as percentualAutoSuplLoa,
	Orcamento.[CadastrosAuxiliares].[Orcamento].[numeroLoa] as numeroLoa,
	Orcamento.[CadastrosAuxiliares].[Orcamento].[dataPublLdo] as dataPublLdo,
	Orcamento.[CadastrosAuxiliares].[Orcamento].[numeroLdo].[numero] as numeroLdoNumero,
	Orcamento.[CadastrosAuxiliares].[Orcamento].[numeroLdo].[ano] as numeroLdoAno
INTO
    [tb-orcamento]
FROM
    [cadastrosauxiliares] Orcamento



SELECT 
    unidadeOrcamentariaElement.ArrayValue.[codigoUnidOrcamentaria] as codigoUnidOrcamentaria,
    unidadeOrcamentariaElement.ArrayValue.[nomeUnidOrcamentaria] as nomeUnidOrcamentaria,
    unidadeOrcamentariaElement.ArrayValue.[tipoUnidOrcamentaria] as tipoUnidOrcamentaria
INTO
    [tb-unidadeorcamentaria]
FROM
    [cadastrosauxiliares] UnidadeOrcamentaria
CROSS APPLY
	GetArrayElements(UnidadeOrcamentaria.[CadastrosAuxiliares].[UnidadeOrcamentaria]) AS unidadeOrcamentariaElement



SELECT 
    programaElement.ArrayValue.[codigoPrograma] as codigoPrograma,
    programaElement.ArrayValue.[denominacaoPrograma] as denominacaoPrograma,
    programaElement.ArrayValue.[descricaoObjePrograma] as descricaoObjePrograma,
    programaElement.ArrayValue.[valorPrevDespCorrPpa] as valorPrevDespCorrPpa,
    programaElement.ArrayValue.[valorPrevDespCapiPpa] as valorPrevDespCapiPpa,
    programaElement.ArrayValue.[tipoPrograma] as tipoPrograma,
    programaElement.ArrayValue.[numeroLeiCriaAltePpa].[numero] as numeroLeiCriaAltePpaNumero,
    programaElement.ArrayValue.[numeroLeiCriaAltePpa].[ano] as numeroLeiCriaAltePpaAno
INTO
    [tb-programa]
FROM
    [cadastrosauxiliares] Programa
CROSS APPLY
	GetArrayElements(Programa.[CadastrosAuxiliares].[Programa]) AS programaElement