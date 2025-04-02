<template>
    <div>
        <table v-if="operadoras.length">
            <thead>
                <tr>
                    <th class="registro_ans">Registro ANS</th>
                    <th>Razão Social</th>
                    <th>Nome Fantasia</th>
                    <th>Modalidade</th>
                    <th>Cidade/UF</th>
                </tr>
            </thead>
            <tbody>
                <tr
                    v-for="operadora in operadoras"
                    :key="operadora.Registro_ANS"
                >
                    <td>{{ operadora.Registro_ANS }}</td>
                    <td>{{ operadora.Razao_Social }}</td>
                    <td>{{ operadora.Nome_Fantasia || "N/A" }}</td>
                    <td>{{ operadora.Modalidade }}</td>
                    <td>{{ operadora.Cidade }}/{{ operadora.UF }}</td>
                </tr>
            </tbody>
        </table>

        <p v-else>Nenhuma operadora encontrada.</p>
    </div>
</template>

<script>
export default {
    props: {
        operadoras: {
            type: Array,
            required: true,
            default: () => [],
        },
    },
};
</script>

<style scoped>
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    color: #808080;
    border-radius: 8px;
    overflow: hidden;

    table-layout: fixed;
}

tbody tr {
    font-size: 14px;
    display: table-row;
    
}

tbody tr:nth-child(even) {
    background-color: #f4f6fa;
}

tbody tr:nth-child(odd) {
    background-color: #ffffff;
}

tbody tr:hover {
    background-color: #eff2f8 !important;
    color: #222;
}

th, td {
    border: none;
    padding: 16px;
    text-align: left;
    font-weight: normal;
}

th {
    background-color: #272643;
    color: #fafafa;
    height: 60px;
}

</style>
