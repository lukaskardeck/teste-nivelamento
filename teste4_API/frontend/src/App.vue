<template>
    <main>
        <h1>Consulta de Operadoras</h1>
        <div>
            <OperadoraInput @buscar="fetchOperadoras" />
            <OperadoraTable :operadoras="operadoras" />
        </div>
    </main>
</template>

<script>
import api from "@/services/api";
import OperadoraInput from "@/components/OperadoraInput.vue";
import OperadoraTable from "@/components/OperadoraTable.vue";

export default {
    components: {
        OperadoraInput,
        OperadoraTable,
    },

    data() {
        return {
            operadoras: [],
        };
    },

    methods: {
        async fetchOperadoras(nome) {
            try {
                const response = nome
                    ? await api.get(`/operadoras/busca?nome=${nome}`)
                    : await api.get("/operadoras");

                this.operadoras = response.data;
            } catch (error) {
                console.error("Erro ao buscar operadoras:", error);
            }
        },
    },

    mounted() {
        this.fetchOperadoras(); // Carregar todas as operadoras ao iniciar
    },
};
</script>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

#app {
    font-family: "Poppins", sans-serif;
    font-optical-sizing: auto;
    font-weight: <weight>;
    font-style: normal;
    font-variation-settings: "wdth" 100;

    min-height: 100vh;
    background-color: #8bc6ec;
    background-image: linear-gradient(135deg, #8bc6ec 0%, #9599e2 100%);
    padding: 40px 240px;
}

h1 {
    margin-bottom: 40px;
    text-align: center;
    color: #272643;
    font-size: 3rem;
}
</style>
