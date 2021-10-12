namespace Main
{
    partial class FormEncryptedFiles
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridViewEncryptedFiles = new System.Windows.Forms.DataGridView();
            this.ColumnDeleted = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnPath = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewEncryptedFiles)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridViewEncryptedFiles
            // 
            this.dataGridViewEncryptedFiles.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewEncryptedFiles.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ColumnDeleted,
            this.ColumnPath});
            this.dataGridViewEncryptedFiles.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridViewEncryptedFiles.Location = new System.Drawing.Point(0, 0);
            this.dataGridViewEncryptedFiles.Name = "dataGridViewEncryptedFiles";
            this.dataGridViewEncryptedFiles.Size = new System.Drawing.Size(594, 326);
            this.dataGridViewEncryptedFiles.TabIndex = 0;
            // 
            // ColumnDeleted
            // 
            this.ColumnDeleted.HeaderText = "Deleted";
            this.ColumnDeleted.Name = "ColumnDeleted";
            this.ColumnDeleted.ReadOnly = true;
            this.ColumnDeleted.Width = 50;
            // 
            // ColumnPath
            // 
            this.ColumnPath.HeaderText = "Path";
            this.ColumnPath.Name = "ColumnPath";
            this.ColumnPath.ReadOnly = true;
            this.ColumnPath.Width = 500;
            // 
            // FormEncryptedFiles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(594, 326);
            this.Controls.Add(this.dataGridViewEncryptedFiles);
            this.Name = "FormEncryptedFiles";
            this.Text = "EncryptedFiles";
            this.Load += new System.EventHandler(this.FormEncryptedFiles_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewEncryptedFiles)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewEncryptedFiles;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnDeleted;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnPath;
    }
}