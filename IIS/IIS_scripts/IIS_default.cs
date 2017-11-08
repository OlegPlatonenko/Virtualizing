using System;
using System.Text;
using Microsoft.Web.Administration;

internal static class Sample {

    private static void Main() {
        
        using(ServerManager serverManager = new ServerManager()) { 
            Configuration config = serverManager.GetWebConfiguration("Default Web Site");
            
            ConfigurationSection appSettingsSection = config.GetSection("appSettings");
            
            ConfigurationElementCollection appSettingsCollection = appSettingsSection.GetCollection();
            
            ConfigurationElement addElement = appSettingsCollection.CreateElement("add");
            addElement["key"] = @"test";
            addElement["value"] = @"test2";
            appSettingsCollection.Add(addElement);
            
            serverManager.CommitChanges();
        }
    }
}