using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using MySql.Data.MySqlClient;

namespace PadariaCarmel
{
    public partial class frmCadastrarUsuarios : Form
    {
        //Criando variáveis para controle do menu
        const int MF_BYCOMMAND = 0X400;
        [DllImport("user32")]
        static extern int RemoveMenu(IntPtr hMenu, int nPosition, int wFlags);
        [DllImport("user32")]
        static extern IntPtr GetSystemMenu(IntPtr hWnd, bool bRevert);
        [DllImport("user32")]
        static extern int GetMenuItemCount(IntPtr hWnd);

        public frmCadastrarUsuarios()
        {
            InitializeComponent();
            desabilitarCampos();
        }

        //desabilitar campos
        public void desabilitarCampos()
        {
            txtCodigo.Enabled = false;
            txtNome.Enabled = false;
            txtSenha.Enabled = false;
            txtContraSenha.Enabled = false;

            btnCadastrar.Enabled = false;
            btnAlterar.Enabled = false;
            btnExcluir.Enabled = false;
            btnLimpar.Enabled = false;
        }

        private void btnNovo_Click(object sender, EventArgs e)
        {
            habilitarCampos();
            carregaFuncionarios();

        }
        //habilitar campos
        public void habilitarCampos()
        {
            txtCodigo.Enabled = false;
            txtNome.Enabled = true;
            txtSenha.Enabled = true;
            txtContraSenha.Enabled = true;

            btnCadastrar.Enabled = true;
            btnAlterar.Enabled = false;
            btnExcluir.Enabled = false;
            btnLimpar.Enabled = true;
            btnNovo.Enabled = false;

            txtNome.Focus();
        }

        private void frmCadastrarUsuarios_Load(object sender, EventArgs e)
        {
            IntPtr hMenu = GetSystemMenu(this.Handle, false);
            int MenuCount = GetMenuItemCount(hMenu) - 1;
            RemoveMenu(hMenu, MenuCount, MF_BYCOMMAND);
        }

        private void btnCadastrar_Click(object sender, EventArgs e)
        {
            if (txtNome.Text.Equals("") || txtSenha.Text.Equals("")
                || txtContraSenha.Text.Equals(""))
            {
                MessageBox.Show("Não é permitido campo vazio", "Mensagem do Sistema",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtNome.Focus();
            }
            else
            {
                cadastrarUsuarios();

                MessageBox.Show("Cadastrado com sucesso!!!",
                    "Mensagem do sistema.",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information,
                    MessageBoxDefaultButton.Button1);

                desabilitarCampos();
                btnNovo.Enabled = true;
                limparCampos();
            }
        }

        //limpar campos
        public void limparCampos()
        {
            txtCodigo.Enabled = false;
            txtNome.Clear();
            txtSenha.Clear();
            txtContraSenha.Clear();

            txtNome.Focus();
        }

        //cadastrar usuários
        public void cadastrarUsuarios()
        {
            MySqlCommand comm = new MySqlCommand();
            comm.CommandText = "insert into tbUsuarios(nome,senha,codFunc)values(@nome,@senha,@codFunc);";
            comm.CommandType = CommandType.Text;

            comm.Parameters.Clear();
            comm.Parameters.Add("@nome", MySqlDbType.VarChar, 50).Value = txtNome.Text;
            comm.Parameters.Add("@senha", MySqlDbType.VarChar, 14).Value = txtSenha.Text;

            comm.Connection = Conectar.obterConexao();
            int res = comm.ExecuteNonQuery();
            Conectar.fecharConexao();

        }

        //carrega funcionarios
        public void carregaFuncionarios()
        {
            MySqlCommand comm = new MySqlCommand();
            comm.CommandText = "select nome from tbfuncionarios order by nome asc;";
            comm.CommandType = CommandType.Text;

            comm.Connection = Conectar.obterConexao();
            MySqlDataReader DR;
            DR = comm.ExecuteReader();

            lstFuncNCad.Items.Clear();

            while (DR.Read())
            {
                lstFuncNCad.Items.Add(DR.GetString(0));
            }

            Conectar.fecharConexao();

        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            frmMenuPrincipal abrir = new frmMenuPrincipal();
            abrir.Show();
            this.Hide();
        }
    }
}
