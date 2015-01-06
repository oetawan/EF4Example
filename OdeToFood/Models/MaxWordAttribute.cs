using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace OdeToFood.Models
{
    public class MaxWordAttribute : ValidationAttribute
    {
        int _maxWork;
        public MaxWordAttribute(int maxWord)
            : base("{0} has to many words.")
        {
            _maxWork = maxWord;
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value != null)
            {
                string valueAsString = value.ToString();
                if (valueAsString.Split(' ').Length > 1)
                {
                    var errorMessage = FormatErrorMessage(validationContext.DisplayName);
                    return new ValidationResult(errorMessage);
                }
            }

            return ValidationResult.Success;
        }
    }
}