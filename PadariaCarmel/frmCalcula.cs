using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PadariaCarmel
{
    public partial class frmCalcula : Form
    {
        public frmCalcula()
        {
            InitializeComponent();
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            //Close();
            Application.Exit();
        }

        private void btnLimpar_Click(object sender, EventArgs e)
        {
            txtNum1.Text = "";
            txtNum2.Clear();
            lblResposta.Text = "";
            rdbSoma.Checked = false;
            rdbSubtracao.Checked = false;
            rdbMultiplicacao.Checked = false;
            rdbDivisao.Checked = false;
            txtNum1.Focus();

        }

        private void btnCalcular_Click(object sender, EventArgs e)
        {
            //declaração das variáveis
            double num1, num2, resp = 0;
            try
            {
                num1 = Convert.ToDouble(txtNum1.Text);
                num2 = Convert.ToDouble(txtNum2.Text);

                if (rdbSoma.Checked || rdbSubtracao.Checked || rdbMultiplicacao.Checked || rdbDivisao.Checked)
                {
                    //estrutura de decisão
                    if (rdbSoma.Checked)
                    {
                        //somar
                        resp = num1 + num2;
                    }
                    if (rdbSubtracao.Checked)
                    {
                        //subtração
                        resp = num1 - num2;
                    }
                    if (rdbMultiplicacao.Checked)
                    {
                        //multiplicação
                        resp = num1 * num2;
                    }
                    if (rdbDivisao.Checked)
                    {
                        //divisão

                        if (num2 == 0)
                        {
                            MessageBox.Show("Impossível dividir por 0");
                            txtNum1.Text = "";
                            txtNum2.Text = "";
                            lblResposta.Text = "";
                            rdbDivisao.Checked = false;
                            txtNum1.Focus();
                        }
                        else
                        {
                            resp = num1 / num2;
                        }
                    }
                    lblResposta.Text = resp.ToString();
                }
                else
                {
                    MessageBox.Show("Favor selecionar uma operação",
                        "Mensagem do sistema",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Warning,
                        MessageBoxDefaultButton.Button1);
                }

               
            }
            catch (Exception)
            {
                MessageBox.Show("Favor inserir somente números!!!");
                txtNum1.Clear();
                txtNum2.Text = "";
                txtNum1.Focus();
            }
        }
    }
}
